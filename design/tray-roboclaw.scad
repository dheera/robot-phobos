L=138;
W=65.5;
H=37;

bW=45.72;
bL=66.68;

difference() {
    translate([-L/2,-W/2,0])
    cube([L,W,H]);
    
    difference() {
        translate([-L/2+1.5,-W/2+1.5,1.5])
        cube([L-3,W-3,H]);
        translate([-6,W/2-6,0])
        cube([12,6,H]);
        translate([-6,-W/2,0])
        cube([12,6,H]);
    }

        translate([-4.5,W/2-6+1.5,0])
        cube([9,6,H]);
        translate([-4.5,-W/2-1.5,0])
        cube([9,6,H]);
    /*
    translate([0,-W/2,0])
    cube([8,8,H]);
    translate([0,W/2,0])
    cube([8,8,H]);
*/
    /*
    translate([0,0,8])
    minkowski() {
        rotate([90,0,0])
        cylinder(d=8,h=W*2,center=true,$fn=32);
        cube([.001,.001,22]);
    }
    */
}

translate([16,0,0]) {
translate([-bL/2,-bW/2,1.5])
standoff();
translate([bL/2,-bW/2,1.5])
standoff();
translate([-bL/2,bW/2,1.5])
standoff();
translate([bL/2,bW/2,1.5])
standoff();
}

module standoff() {
    difference() {
        cylinder(d=5,h=6,$fn=32);
        cylinder(d=2,h=6,$fn=32);
    }
}