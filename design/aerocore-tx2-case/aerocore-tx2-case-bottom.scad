L=157;
W=115;
H=5;

THICK = 2.0;

bW=85;
bL=135;

hW=100;
hL=110;

difference() {
    translate([-L/2-THICK,-W/2-THICK,0])
    cube([THICK,W+2*THICK,45]);

    difference() {
    translate([-L/2-THICK,18,22.5])
    rotate([0,90,0])
    fanvent();
        
    translate([0,0,6])
    cube([2*L,19,8],center=true);
    }
    
    translate([0,0,7.5])
    cube([2*L,15,3],center=true);
    
    translate([0,-34,36])
    cube([2*L,15,36],center=true);
    
    translate([0,-34,36])
    cube([L+ (THICK-1.5)*2,20,42],center=true);
}

translate([L/2+THICK,W/2+THICK/2,0])
rotate([0,0,180])
triangle3();
translate([L/2+THICK,-W/2-THICK/2,0])
rotate([0,0,180])
triangle3();
translate([-L/2-THICK,W/2+THICK/2,0])
rotate([0,0,0])
triangle3();
translate([-L/2-THICK,-W/2-THICK/2,0])
rotate([0,0,0])
triangle3();

translate([L/2,7.5,0])
triangle();
translate([L/2,-7.5,0])
triangle();
translate([-L/2,-34-24/2,0])
rotate([0,0,180])
triangle2();
translate([-L/2,-34+24/2,0])
rotate([0,0,180])
triangle2();

module triangle() {
rotate([0,-90,90])
linear_extrude(height = THICK, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[45,0],[0,11.5]]);
}

module triangle2() {
rotate([0,-90,90])
linear_extrude(height = THICK, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[45,0],[0,4]]);
}

module triangle3() {
rotate([0,-90,90])
linear_extrude(height = THICK, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[45,0],[0,8]]);
}

difference() {
    union() {
        translate([L/2,-W/2-THICK,0])
        cube([THICK,W+2*THICK,45]);
        
        translate([L/2-THICK,-17/2,0])
        cube([2*THICK,17,33]);
    }
    
    translate([L/2-.5,29,22.5])
    rotate([0,90,0])
    fanholes40();
    
    translate([L/2-.5,-29,22.5])
    rotate([0,90,0])
    fanholes40();
    
    translate([0,0,2*THICK])
    cube([2*L,13,7],center=true);
    
    translate([0,0,13])
    cube([2*L,15,3],center=true);
    
    translate([0,0,25])
    cube([2*L,10, 10],center=true);
}

module fanvent() {
    translate([-30/2-3.5/2,-68.5/2-3.5,0]) {
    for (i = [0:6:30]) {
        for (j = [0:6:60]) {
            translate([i,j,-15])
            cube([3.5,3.5,30]);
        }
    }
}
}

module fanholes40() {
    translate([-16,-16,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([-16,16,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([16,-16,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([16,16,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    difference() {
    cylinder(d=35,h=5,$fn=64);
    
    rotate([0,0,90]) {
    translate([-25,-1,0])
    cube([50,2,5]);
        
    translate([-25,-1-9.5,0])
    cube([50,2,5]);
        
    translate([-25,-1+9.5,0])
    cube([50,2,5]);
        
    }
    translate([-25,-1,0])
    cube([50,2,5]);
        
    translate([-25,-1-9.5,0])
    cube([50,2,5]);
        
    translate([-25,-1+9.5,0])
    cube([50,2,5]);
}
    
    cube([40,40,0.01], center=true);
    
}

module fanholes() {
    translate([-10,-10,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([-10,10,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([10,-10,0])
    cylinder(d=3.5,h=5,$fn=16);
    
    translate([10,10,0])
    cylinder(d=3.5,h=5,$fn=16);
    
}

difference() {
    union() {
    translate([-L/2,-W/2,0])
    cube([L,W,H]);
    
    translate([-L/2-THICK,-W/2-THICK,0])
    cube([L+2*THICK,W+2*THICK,THICK]);
        
    translate([0,0,THICK/2])
    cube([L+20,W+2*THICK,THICK],center=true);
    }
    
    translate([THICK,0,THICK+2*THICK])
    cube([L,W-16,4*THICK],center=true);
    
    translate([-L/2+THICK,-W/2+THICK,THICK])
    cube([L-2*THICK,W-2*THICK,H]);

    inside_mount_holes();
    through_holes();
    button_holes();
}

translate([-5,0,THICK])
aerocore_standoffs();

translate([0,0,THICK])
comm_supports();

        translate([0,0,THICK])
        button_tubes();

power_connector();

module power_connector() {
    translate([L/2+THICK,0,THICK+9.5/2-2.0])
    translate([-11/2,0,0])
    difference() {
        cube([11,14.8,8.5], center=true);
        cube([11,10.8,5.5], center=true);
    }
}

module button_holes() {  
    translate([bL/2-27.5-5,bW/2-22,0])
    cylinder(d=3,h=5,$fn=32);
    
    translate([bL/2-24.5-5,-bW/2+15.8,0])
    cylinder(d=3,h=5,$fn=32);
}

module button_tubes() {  
    translate([bL/2-27.5-5,bW/2-22,0])
    difference() {
    cylinder(d=5,h=2,$fn=32);
    cylinder(d=3,h=2,$fn=32);
    }
    
    translate([bL/2-24.5-5,-bW/2+15.8,0])
    difference() {
    cylinder(d=5,h=2,$fn=32);
    cylinder(d=3,h=2,$fn=32);
    }
}

module inside_mount_holes() {  
    translate([-hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([hL/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    
    translate([170/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([170/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-170/2,hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-170/2,-hW/2,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([170/2,10,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([170/2,-10,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-170/2,10,0])
    cylinder(d=3.6,h=5,$fn=32);
    translate([-170/2,-10,0])
    cylinder(d=3.6,h=5,$fn=32);
}

module through_holes() {
    
    translate([-25,hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([25,hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([-25,-hW/2,0])
    cylinder(d=7,h=5,$fn=32);
    translate([25,-hW/2,0])
    cylinder(d=7,h=5,$fn=32);
}

module aerocore_standoffs() {
translate([-bL/2,-bW/2,0])
standoff(d=6,h=5.5);
translate([bL/2,-bW/2,0])
standoff(d=6,h=5.5);
translate([-bL/2,bW/2,0])
standoff(d=6,h=5.5);
translate([bL/2,bW/2,0])
standoff(d=6,h=5.5);
}

module comm_supports() {
translate([-L/2+4,-W/2+4,0])
support2();
translate([-L/2+4,W/2-4,0])
rotate([0,0,180])
support2();
translate([L/2-4,-W/2+4,0])
support2();
translate([L/2-4,W/2-4,0])
    
    rotate([0,0,180]) 
support2();
translate([L/4-2,-W/2+4,0])
support();
translate([-L/4+2,-W/2+4,0])
support();
translate([L/4-2,W/2-4,0])
support();
translate([-L/4+2,W/2-4,0])
support();
}

module support() {
    difference() {
        translate([-4,-4])
        cube([8,8,31]);
        cylinder(d=4.7,h=40,$fn=32);
    }
}

module support2() {
    difference() {
        translate([-4,-4])
        cube([8,8,31]);
        translate([0,0,25])
        cylinder(d=4.7,h=40,$fn=32);
        
        translate([0,0,6])
        rotate([90,0,0])
        cylinder(d=4.7,h=40,$fn=32);
    }
}

module standoff(h=4,d=4) {
    difference() {
        cylinder(d=d,h=h,$fn=32);
        cylinder(d=1.7,h=6,$fn=32);
    }
}

module corner() {
    
difference() {
    translate([-3.5,-3.5,0])
    cube([7,7,H]);
    cylinder(h=2*H,d=4.7,$fn=16);
}
}