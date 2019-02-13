L=185;
W=71;
H=38;

difference() {
  cube([L+6,W+6,H+3]);

  translate([3,3,3])
  cube([L,W,H+8]);
  
  translate([0,0,H-2])
  difference() {
      cube([L+6,W+6,H+6]);
      translate([1.5,1.5,0])
      cube([L+3,W+3,H+3]);
  }
  
  translate([L/2,W-5,(H+3)/2-5/2])
  cube([L+10,5,10]);
}
