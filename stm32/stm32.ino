#include <Wire.h>
#include <HardwareSerial.h>
#include <SPI.h>

#define HAVE_HWSERIAL7
#define HAVE_HWSERIAL3
#define HAVE_HWSERIAL2
#define HAVE_HWSERIAL1

//SPIClass spi(PIN_SPI3_MOSI, PIN_SPI3_MISO, PIN_SPI3_SCK); // DOESN'T WORK
SPIClass spi(PC12, PC11, PC10); // works

SPISettings spi_cfg(14000000, MSBFIRST, SPI_MODE0); 

extern SPIClass spi;
extern SPISettings spi_cfg;

// chip select pins
#define CS_ACC PE2
#define CS_GYR PE3
//#define CS_BAR PE4 // DOESN'T WORK (PE4 not defined in variants.h)

// LSM303D registers
#define OUT_X_L_M   0x08
#define OUT_X_H_M   0x09
#define OUT_Y_L_M   0x0A
#define OUT_Y_H_M   0x0B
#define OUT_Z_L_M   0x0C
#define OUT_Z_H_M   0x0D
#define CTRL1       0x20
#define CTRL2       0x21
#define CTRL5       0x24
#define CTRL7       0x26
#define OUT_X_L_A   0x28
#define OUT_X_H_A   0x29
#define OUT_Y_L_A   0x2A
#define OUT_Y_H_A   0x2B
#define OUT_Z_L_A   0x2C
#define OUT_Z_H_A   0x2D

#define TEMP_OUT_L  0x05
#define TEMP_OUT_H  0x06

#define OUT_X_L     0x28
#define OUT_X_H     0x29
#define OUT_Y_L     0x2A
#define OUT_Y_H     0x2B
#define OUT_Z_L     0x2C
#define OUT_Z_H     0x2D


void setup() {

  // put your setup code here, to run once:
  Serial.begin(9600);
 
  while(!Serial);
  
  Serial1.begin(9600); // gps
  Serial3.begin(57600); // jetson
  Serial2.begin(9600); // header left
  Serial7.begin(9600); // header right
  pinMode(PE9, OUTPUT);
  pinMode(CS_ACC, OUTPUT);
  pinMode(CS_GYR, OUTPUT);
  //pinMode(CS_BAR, OUTPUT);
  digitalWrite(CS_ACC, HIGH);
  digitalWrite(CS_GYR, HIGH);
  //digitalWrite(CS_BAR, HIGH);

  spi.begin();
  writeReg(CS_ACC, CTRL1, 0b01010111);
  writeReg(CS_ACC, CTRL2, 0b01010000);
  writeReg(CS_ACC, CTRL5, 0xf4);
  writeReg(CS_ACC, CTRL7, 0b00000000);  
  
  writeReg(CS_GYR, CTRL1, 0x0F);
}

int8_t readData   = 0x80;
int8_t writeData  = 0x00;

int8_t readReg(int8_t CS, int8_t address) {
  int8_t buffer = 0;
  digitalWrite(CS, LOW);
  delayMicroseconds(100);
  spi.beginTransaction(spi_cfg);
  spi.transfer(readData | address);
  buffer = spi.transfer(writeData);
  spi.endTransaction();
  digitalWrite(CS, HIGH);
  return(buffer);  
}

void writeReg(int8_t CS, int8_t address, int8_t val) {
  digitalWrite(CS, LOW);
  delayMicroseconds(100);
  spi.beginTransaction(spi_cfg);
  spi.transfer(writeData | address);
  spi.transfer(val);
  spi.endTransaction();
  digitalWrite(CS, HIGH);
}

bool ledState = false;
void loop() {
  // put your main code here, to run repeatedly:
  ledState = !ledState;
  digitalWrite(PE9, ledState);
  
  int16_t ax, ay, az;
  int16_t mx, my, mz;
  int16_t gx, gy, gz;
  
  
  mx = (int16_t) readReg(CS_ACC, OUT_X_H_M) <<8 | readReg(CS_ACC, OUT_X_L_M); // typecast as
  my = (int16_t) readReg(CS_ACC, OUT_Y_H_M) <<8 | readReg(CS_ACC, OUT_Y_L_M); // 16-bit
  mz = (int16_t) readReg(CS_ACC, OUT_Z_H_M) <<8 | readReg(CS_ACC, OUT_Z_L_M);
  
  ax = readReg(CS_ACC, OUT_X_H_A) <<8 | readReg(CS_ACC, OUT_X_L_A);
  ay = readReg(CS_ACC, OUT_Y_H_A) <<8 | readReg(CS_ACC, OUT_Y_L_A);
  az = readReg(CS_ACC, OUT_Z_H_A) <<8 | readReg(CS_ACC, OUT_Z_L_A);
  
  gx = readReg(CS_GYR, OUT_X_H) <<8 | readReg(CS_GYR, OUT_X_L);
  gy = readReg(CS_GYR, OUT_Y_H) <<8 | readReg(CS_GYR, OUT_Y_L);
  gz = readReg(CS_GYR, OUT_Z_H) <<8 | readReg(CS_GYR, OUT_Z_L);


  Serial3.print("M"); Serial3.print("\t");
  Serial3.print(mx); Serial3.print("\t");
  Serial3.print(my); Serial3.print("\t");
  Serial3.print(mz); Serial3.print("\t");
  
  Serial3.println();
  
  Serial3.print("A"); Serial3.print("\t");
  Serial3.print(ax); Serial3.print("\t");
  Serial3.print(ay); Serial3.print("\t");
  Serial3.print(az); Serial3.print("\t");

  Serial3.println();
  
  Serial3.print("G"); Serial3.print("\t");
  Serial3.print(gx); Serial3.print("\t");
  Serial3.print(gy); Serial3.print("\t");
  Serial3.print(gz); Serial3.print("\t");
  
  Serial3.println();
  Serial3.flush();
}

