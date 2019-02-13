difference() {
    translate([-250/2,-119/2,0])
    cube([250,119,1.5]);
    
    translate([0,-119/2,0])
    translate([-40/2,-25/2,0])
    cube([40,25,3]);

    translate([0,119/2,0])
    translate([-40/2,-25/2,0])
    cube([40,25,3]);
    
    translate([-25,-50,0])
cylinder(d=5.5,h=5,$fn=16);
translate([25,-50,0])
cylinder(d=5.5,h=5,$fn=16);
    translate([-25,50,0])
cylinder(d=5.5,h=5,$fn=16);
    translate([25,50,0])
cylinder(d=5.5,h=5,$fn=16);
    
    translate([250/2,0,0])
cylinder(d=5.5,h=5,$fn=16);
translate([250/2,-50,0])
cylinder(d=5.5,h=5,$fn=16);
translate([250/2,50,0])
cylinder(d=5.5,h=5,$fn=16);
translate([-250/2,0,0])
cylinder(d=5.5,h=5,$fn=16);
translate([-250/2,-50,0])
cylinder(d=5.5,h=5,$fn=16);
translate([-250/2,50,0])
cylinder(d=5.5,h=5,$fn=16);
    }

translate([-80.5/2,0,0])
translate([-70,-143/2,0])
difference() {
    cube([70,143,1.5]);
    translate([70/2,0,0])
    cylinder(d=15,h=5,$fn=32);
    translate([70/2,143,0])
    cylinder(d=15,h=5,$fn=32);
}

translate([80.5/2,0,0])
translate([0,-143/2,0])
difference() {
    cube([70,143,1.5]);
    translate([70/2,0,0])
    cylinder(d=15,h=5,$fn=32);
    translate([70/2,143,0])
    cylinder(d=15,h=5,$fn=32);
}

translate([0,0,1.5])
difference() {
    translate([-195/2,-81/2])
    cube([195,81,44]);
    translate([-192/2,-78/2])
    cube([192,78,44]);
    translate([-200/2,-70/2,10])
    cube([200,70,44]);
}

    translate([-25,-50,0])
standoff();
translate([25,-50,0])
standoff();
translate([-25,50,0])
standoff();    translate([25,50,0])
standoff();

translate([250/2,0,0])
halfstandoff();
translate([250/2,-50,0])
halfstandoff();
translate([250/2,50,0])
halfstandoff();

translate([-250/2,0,0])
rotate([0,0,180])
halfstandoff();
translate([-250/2,-50,0])
rotate([0,0,180])
halfstandoff();
translate([-250/2,50,0])
rotate([0,0,180])
halfstandoff();

translate([-85/2-0.5,81/2,1.5])
support();
translate([85/2+0.5,81/2,1.5])
support();
translate([-192/2-0.5,81/2,1.5])
support();
translate([192/2+0.5,81/2,1.5])
support();
translate([-85/2-0.5,-81/2,1.5])
rotate([0,0,180])
support();
translate([85/2+0.5,-81/2,1.5])
rotate([0,0,180])
support();
translate([-192/2-0.5,-81/2,1.5])
rotate([0,0,180])
support();
translate([192/2+0.5,-81/2,1.5])
rotate([0,0,180])
support();

module support() {
rotate([0,-90,0])
linear_extrude(height = 2, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[44,0],[0,12]]);
}

module standoff() {
    difference() {
    cylinder(d=9,h=6,$fn=32);
    cylinder(d=5.5,h=6,$fn=16);
    }
}

module halfstandoff() {
    difference() {
    cylinder(d=9,h=6,$fn=32);
    cylinder(d=5.5,h=6,$fn=16);
    translate([0,-5,0])
    cube([10,10,10]);
    }
}