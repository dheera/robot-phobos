difference() {
    union() {
    translate([0,-119/2,0])
    cube([18,119,1.5]);
        
        
translate([0,-119/2,0])
cube([1.5,119,20]);
    
    translate([9,-25,0])
    chargeportplus();
    
    translate([0,-119/2+1,0])
    support();
        
    translate([0,-6,0])
    support();
        
    translate([0,6,0])
    support();
        
    translate([0,119/2-1,0])
    support();
        
        
translate([0,-50,9.5])
rotate([0,90,0])
standoffplus();
translate([0,50,9.5])
rotate([0,90,0])
standoffplus();

    }
    
    translate([9,25,0])
    switchminus();
    
    translate([9,-25,0])
    chargeportminus();
    
    translate([0,-50,9.5])
rotate([0,90,0])
standoffminus();
translate([0,50,9.5])
rotate([0,90,0])
standoffminus();

translate([0,0,9.5])
rotate([0,90,0])
hole();

}



module standoffplus() {
    difference() {
    cylinder(d=9,h=6,$fn=32);
    cylinder(d=5.5,h=6,$fn=16);
    }
}

module standoffminus() {
    cylinder(d=5.5,h=6,$fn=16);
}

module switchminus() {
    translate([-11.5/2,-26.5/2])
    cube([11.5,26.5,5]);
}

module chargeportminus() {
    translate([-10.5/2,-18/2,0])
    cube([10.5,18,9]);
}

module support() {
rotate([90,0,0])
linear_extrude(height = 2, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[18,0],[0,20]]);
}

module chargeportplus() {
    difference() {
        translate([-16/2,-24/2,0])
        cube([16,24,14]);
        
        translate([0,0,9])
        translate([-8.3/2,-15.5/2,0])
        cube([8.3,15.5,4]);
        
        translate([0,0,13])
        translate([-9.3/2,-16.5/2,0])
        cube([9.3,16.5,9]);
    }
}

module hole() {
    cylinder(d=4,h=5,$fn=16);
}