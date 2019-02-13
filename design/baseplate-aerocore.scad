L=155;
W=119;
H=6;

bW=85;
bL=135;

hW=100;
hL=130;

difference() {
    translate([-L/2,-W/2,0])
    cube([L,W,H]);
    
    translate([-L/2+1.5,-W/2+1.5,1.5])
    cube([L-3,W-3,H]);

    translate([-25,hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([25,hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([-25,-hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([25,-hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    
    translate([5,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([5,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);  
    translate([-5,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-5,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);    
    translate([-hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
}

translate([-bL/2,-bW/2,1.5])
standoff();
translate([bL/2,-bW/2,1.5])
standoff();
translate([-bL/2,bW/2,1.5])
standoff();
translate([bL/2,bW/2,1.5])
standoff();

module standoff() {
    difference() {
        cylinder(d=4,h=4,$fn=32);
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