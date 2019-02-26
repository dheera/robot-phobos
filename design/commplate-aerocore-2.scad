L=166;
W=116;
H=1.5;

bW=85;
bL=135;

hW=100;
hL=110;

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
    imuW=30.75;
    imuL=20.25;
    translate([-imuL/2,-imuW/2,0])
    standoff();
    translate([imuL/2,-imuW/2,0])
    standoff();
    translate([-imuL/2,imuW/2,0])
    standoff();
    translate([imuL/2,imuW/2,0])
    standoff();
}

difference() {
    translate([-L/2,-W/2,0])
    cube([L,W,H]);
   

    inside_mount_holes();
    through_holes();
    
    button_holes();
    comm_holes();
    tx2_hole();
    
    side_cutouts();
}

translate([0,0,1.5]) {
    translate([0,-35,0])
    rotate([0,0,90])
    gpsantenna();
    
    translate([-40,-30,0])
    rotate([0,0,90])
    gps();
    
    translate([40,-30,0])
    rotate([0,0,90])
    imu();
}


translate([-63,0,0])
ridge();

translate([63,0,0])
ridge();

module ridge() {
    intersection() {
        translate([0,0,-1000/2+5])
        rotate([0,90,0])
        cylinder(d=1000,h=1.5,center=true,$fn=256);
        
        translate([0,0,15/2])
        cube([1.5,W,15], center=true);
    }
}

module side_cutouts() {
    translate([L/2,0,0])
    minkowski() {
        cube([12,W-40,5], center=true);
        cylinder(d=20,h=0.0001);
    }
    translate([-L/2,0,0])
    minkowski() {
        cube([12,W-40,5], center=true);
        cylinder(d=20,h=0.0001);
    }
}

module tx2_hole() {
    translate([-25,-5,0])
    cube([80,45,5]);
}

module button_holes() {  
    translate([5,-15,0])
    cylinder(d=5,h=5,$fn=32);
}

module inside_mount_holes() {  
    translate([-hL/2,-hW/2,0])
    cylinder(d=6,h=5,$fn=32);
    translate([-hL/2,hW/2,0])
    cylinder(d=6,h=5,$fn=32);
    translate([hL/2,-hW/2,0])
    cylinder(d=6,h=5,$fn=32);
    translate([hL/2,hW/2,0])
    cylinder(d=6,h=5,$fn=32);
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