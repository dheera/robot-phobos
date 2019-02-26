import("aerocore-tx2-case-bottom.stl");


translate([0,0,34])
import("aerocore-tx2-case-comm-tray.stl", convexity=3);


intersection() {
translate([0,0,47])
rotate([0,180,0])
import("aerocore-tx2-case-lid.stl", convexity=3);
cube([200,200,2*10],center=true);
}
