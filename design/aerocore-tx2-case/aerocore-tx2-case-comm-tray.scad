L=157 ;
W=115;
H=2;

bW=85;
bL=135;

hW=100;
hL=110;

difference() {
    translate([-L/2+0.1,-W/2+0.1,0])
    cube([L-0.2,W-0.2,H]);
    
    button_holes();
    comm_holes();
    tx2_hole();
    
    side_cutouts();
}
translate([0,0,2]) {
    translate([-12,-39,0])
    rotate([0,0,90])
    gpsantenna();
    
    translate([-48,-35,0])
    rotate([0,0,90])
    gps();
    
    translate([45,-35,0])
    rotate([0,0,90])
    imu();
    
    translate([-63,15,0])
    rotate([0,0,90])
    antenna(aL=70.7,aW=20.7);
    
    translate([0,45.5,0])
    rotate([0,0,0])
    antenna(aL=70.7,aW=20.7);
    
    translate([58,20,0])
    rotate([0,0,90])
    antenna(aL=14.7,aW=5.7);
    
    translate([50,40,0])
    rotate([0,0,0])
    antenna(aL=14.7,aW=5.7);
}

module gpsantenna() {
    difference() {
    translate([-26.5/2,-26.5/2])
    cube([26.5,26.5,3]);
    translate([-24.5/2,-24.5/2])
    cube([24.5,24.5,4]);
    cube([8,50,15],center=true);
    }
}

module standoff() {
    difference() {
        cylinder(d=5,h=3,$fn=32);
        cylinder(d=1.5,h=6,$fn=32);
    }
}

module gps() {
    gpsW=30.75;
    gpsL=20.25;
    translate([-gpsL/2,-gpsW/2,0])
    standoff();
    translate([gpsL/2,-gpsW/2,0])
    standoff();
    translate([-gpsL/2,gpsW/2,0])
    standoff();
    translate([gpsL/2,gpsW/2,0])
    standoff();
}

module imu() {
    imuW = 1.05*25.4;
    imuL = 0.8*25.4;
    
    rotate([0,0,90]) {
    
    translate([-imuW/2 + 0.1*25.4, -imuL/2 + 0.1*25.4, 0])
    standoff();
    
    translate([-imuW/2 + 0.95*25.4, -imuL/2 + 0.1*25.4, 0])
    standoff();
    
    translate([-imuW/2 + 0.1*25.4, -imuL/2 + 0.7*25.4, 0])
    standoff();
    
    translate([-imuW/2 + 0.95*25.4, -imuL/2 + 0.7*25.4, 0])
    standoff();
}
}

module antenna(aW=15, aL=50) {
    /*
    translate([aL/2+0.5,0,0.5])
    cube([1, aW+2, 1], center=true);
    */ 
    translate([0,-aW/2-0.5,0.5])
    cube([aL, 1, 1], center=true);
    
    translate([0,aW/2+0.5,0.5])
    cube([aL, 1, 1], center=true);
    /*
    translate([aL/2+1-sqrt(2)/2,0,1])
    rotate([0,45,0])
    cube([1, aW+2, 1], center=true);
    */
    translate([0,aW/2+1-sqrt(2)/2,1])
    rotate([45,0,0])
    cube([aL, 1, 1], center=true);
    
    translate([0,-aW/2-1+sqrt(2)/2,1])
    rotate([45,0,0])
    cube([aL, 1, 1], center=true);
}




translate([-75.75,0,0])
ridge();

translate([64.25,0,0])
ridge();

module ridge() {
    intersection() {
        translate([0,0,-800/2+5.1])
        rotate([0,90,0])
        cylinder(d=800,h=1.5,center=true,$fn=256);
        
        translate([0,0,15/2])
        cube([1.5,W-15,15], center=true);
    }
}

module side_cutouts() {
    translate([L/2,0,0])
        cube([27,W-16,5], center=true);
        cylinder(d=8,h=0.0001);
    translate([-L/2,0,0])
        cube([4,W-16,5], center=true);
        cylinder(d=8,h=0.0001);
}

module tx2_hole() {
    translate([32-bL/2-5,24.5-bW/2,0])
    cube([89,52,5]);
    
    translate([21.5-bL/2-5,bW/2-30,0])
    cube([10.5,36,5]);
    
    translate([23.5-bL/2-5,bW/2-55,0])
    cube([10.5,36,5]);
}

module button_holes() {  
    
    /*
    translate([79.7-bL/2-5+15/2,13.3-bW/2,0])
    cube([18,6,5], center=true); // 
    
    translate([79.7-bL/2-5,13.3-bW/2,0])
    cube([6,6,5], center=true); // cylinder(d=6,h=5,$fn=32);
    
    translate([79.7-bL/2-5+15,13.3-bW/2,0])
    cube([6,6,5], center=true); //(d=6,h=5,$fn=32);
    
    translate([77.7-bL/2-5,17.3-bW/2-1,0])
    cube([19,6,5]);
    
    */
    
    translate([75.5-bL/2-5,10-bW/2-1,0])
    cube([23,14,5]);
    
}

module comm_holes() {
translate([-L/2+4,-W/2+4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([-L/2+4,W/2-4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([L/2-4,-W/2+4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([L/2-4,W/2-4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([L/4-2,-W/2+4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([-L/4+2,-W/2+4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([L/4-2,W/2-4,0])
cylinder(d=3.3,h=5,$fn=16);
translate([-L/4+2,W/2-4,0])
cylinder(d=3.3,h=5,$fn=16);
}

module support() {
    difference() {
        translate([-4,-4])
        cube([8,8,31]);
        cylinder(d=4.7,h=40,$fn=32);
    }
}

module standoff() {
    difference() {
        cylinder(d1=5,d2=4,h=4,$fn=32);
        cylinder(d=1.5,h=6,$fn=32);
    }
}

module corner() {
    
difference() {
    translate([-3.5,-3.5,0])
    cube([7,7,H]);
    cylinder(h=2*H,d=4.7,$fn=16);
}
}