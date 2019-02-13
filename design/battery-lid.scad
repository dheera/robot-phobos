L=185;
W=71;
H=38;

difference() {
  cube([L+6,W+6,8]);

  translate([1.6,1.6,3])
  cube([L+2.8,W+2.8,10+8]);
  
    /*
  translate([0,(W+8)*1/4,7])
  rotate([0,90,0])
  cylinder(d=2,h=10,$center=true, $fn=16);

  translate([0,(W+8)*3/4,7])
  rotate([0,90,0])
  cylinder(d=2,h=10,$center=true, $fn=16);
    
  translate([L,(W+8)*1/4,7])
  rotate([0,90,0])
  cylinder(d=2,h=10,$center=true, $fn=16);

  translate([L,(W+8)*3/4,7])
  rotate([0,90,0])
  cylinder(d=2,h=10,$center=true, $fn=16);
    
  translate([(W+8)*1/4,3*W,7])
  rotate([90,0,0])
  cylinder(d=2,h=6*W,$center=true, $fn=16);

  translate([(L+8)-(W+8)*1/4,3*W,7])
  rotate([90,0,0])
  cylinder(d=2,h=6*W,$center=true, $fn=16);
  
  translate([(L+8)*1/2,3*W,7])
  rotate([90,0,0])
  cylinder(d=2,h=6*W,$center=true, $fn=16);
  */
}