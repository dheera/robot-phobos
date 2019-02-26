
difference() {
    minkowski() {
        cylinder(d=4,h=0.001,$fn=16, center=true);
        cube([36,36,1], center=true);
    }
    
    translate([-16,-16,0])
    cylinder(d=3.3,h=5,$fn=32, center=true);
    
    translate([16,-16,0])
    cylinder(d=3.3,h=5,$fn=32, center=true);
    
    translate([-16,16,0])
    cylinder(d=3.3,h=5,$fn=32, center=true);
    
    translate([16,16,0])
    cylinder(d=3.3,h=5,$fn=32, center=true);
    
    cylinder(d=35,h=5,$fn=128, center=true);
}