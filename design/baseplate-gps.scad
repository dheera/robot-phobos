L=40;
W=119;
H=6;

bW=30.75;
bL=20.25;

hW=100;
hL=20;

difference() {
    translate([-L/2,-W/2,0])
    cube([L,W,H]);
    
    translate([-L/2+1.5,-W/2+1.5,1.5])
    cube([L-3,W-3,H]);
  
    translate([-hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
}

translate([-bL/2,-bW/2-22,1.5])
standoff();
translate([bL/2,-bW/2-22,1.5])
standoff();
translate([-bL/2,bW/2-22,1.5])
standoff();
translate([bL/2,bW/2-22,1.5])
standoff();

translate([0,23,1.5])
gpsantenna();

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

module corner() {
    
difference() {
    translate([-3.5,-3.5,0])
    cube([7,7,H]);
    cylinder(h=2*H,d=4.7,$fn=16);
}
}