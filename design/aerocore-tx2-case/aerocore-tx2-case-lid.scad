L=157;
W=115;
THICK=2;

bW=85;
bL=135;

// "bottom" (top) part
scale([-1,1,1])
difference() {
    union() {
    translate([0,0,THICK/2])
    cube([L+2*THICK,W+2*THICK,THICK], center=true);
    }
    
    button_holes();
    //comm_supports_minus();
}

scale([-1,1,1])
usb_wall();

scale([-1,1,1])
button_towers();

module usb_wall() {
    translate([-L/2-THICK,-34,0])
    translate([0,-15/2,0])
    cube([1.5,15,19.5]);
    
    translate([-L/2-THICK+1.5,-34,0])
    translate([0,-19/2,0])
    cube([THICK,19,16]);
}

difference() {
union() {
    translate([0,-W/2,THICK])
    triangle();
    translate([0,W/2,THICK])
    scale([1,-1,1])
    triangle();
}
translate([0,0,THICK])
comm_supports_footprint();
}

// side walls

scale([-1,1,1])
translate([0,W/2,0])
difference() {
    translate([-(L-0.5)/2,0,0])
    cube([(L-0.5),THICK,44.5]);
    translate([-L/2+4,THICK+.01,44.5-5])
    rotate([90,0,0])
    cylinder(d1=5.5,d2=3.5,h=THICK+.02,$fn=32);
    translate([L/2-4,THICK+.01,44.5-5])
    rotate([90,0,0])
    cylinder(d1=5.5,d2=3.5,h=THICK+.02,$fn=32);
}

scale([-1,1,1])
translate([0,-W/2-THICK,0])
difference() {
    translate([-(L-0.5)/2,0,0])
    cube([(L-0.5),THICK,44.5]);
    translate([-L/2+4,THICK+.0,44.5-5])
    rotate([90,0,0])
    cylinder(d1=3.5,d2=5.5,h=THICK+.02,$fn=32);
    translate([L/2-4,THICK+.01,44.5-5])
    rotate([90,0,0])
    cylinder(d1=3.5,d2=5.5,h=THICK+.02,$fn=32);
}


module button_holes() {  

        translate([79.7-bL/2-5,13.3-bW/2,0])
        translate([-4/2,-4/2])
        cube([4,4,39]);
        
        
        translate([79.7-bL/2-5+15,13.3-bW/2,0])
        translate([-4/2,-4/2])
        cube([4,4,39]);
        
        
        translate([77.7-bL/2+19/2-5,17.3+5/2-bW/2,0]) {
            translate([-2.5/2,-2.5/2,0])
            cube([2.5,2.5,39]);
            translate([-2.5/2-6.5,-2.5/2,0])
            cube([2.5,2.5,39]);
            translate([-2.5/2+6.5,-2.5/2,0])
            cube([2.5,2.5,39]);
        }   
}

module button_towers() {  
    difference() {
        translate([75.5-bL/2-5+0.5,10-bW/2-1+0.5,0]){
            cube([22,13,33]);
            translate([0,7,0])
            cube([22,6,39]);
        }
        
        button_holes(); 
    }
}

//comm_supports(); 

module comm_supports_footprint() {
translate([-L/2+4,-W/2+4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([-L/2+4,W/2-4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([L/2-4,-W/2+4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([L/2-4,W/2-4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([L/4-2,-W/2+4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([-L/4+2,-W/2+4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([L/4-2,W/2-4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
translate([-L/4+2,W/2-4,0])
translate([-4.5,-4.5])
cube([9,9,50]);
}

module comm_supports() {
translate([-L/2+4,-W/2+4,0])
support();
translate([-L/2+4,W/2-4,0])
support();
translate([L/2-4,-W/2+4,0])
support();
translate([L/2-4,W/2-4,0])
support();
translate([L/4-2,-W/2+4,0])
support();
translate([-L/4+2,-W/2+4,0])
support();
translate([L/4-2,W/2-4,0])
support();
translate([-L/4+2,W/2-4,0])
support();
}

module comm_supports_minus() {
translate([-L/2+4,-W/2+4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([-L/2+4,W/2-4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([L/2-4,-W/2+4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([L/2-4,W/2-4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([L/4-2,-W/2+4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([-L/4+2,-W/2+4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([L/4-2,W/2-4,0])
cylinder(d=5,h=THICK, $fn=16);
translate([-L/4+2,W/2-4,0])
cylinder(d=5,h=THICK, $fn=16);
}

module triangle() {
rotate([0,270,0])
linear_extrude(height = L, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[5,0],[0,5]]);
}

module support() {
    difference() {
        translate([-4,-4])
        cube([8,8,11.8-1.5-6]);
        // 1.5 for comm tray, 6mm for standoff with thread
        cylinder(d=5.5,h=40,$fn=32);
    }
    translate([0,0,11.8-THICK-1.5-6])
    difference() {
        cylinder(d=6, h=THICK, $fn=16);
        cylinder(d=3, h=THICK, $fn=16);
    }
}