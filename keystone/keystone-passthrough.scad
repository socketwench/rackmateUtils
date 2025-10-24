include <keystone.scad>

Select = 0; // [0:blank, 1:hole, 2:cutoutLeft, 3:cutoutRight]
diameter = 8;

if (Select==0) {
    keystoneBlank(center=true);
} 
else if (Select==1) {
    difference() {
        keystoneBlank(center=true);
        cylinder(h=3, d=diameter, $fn=20);
    }
} 
else if (Select==2) {
    let(w=keystoneBlankWidth()/2) {
        difference() {
            keystoneBlank(center=true);
            cylinder(h=3, d=diameter, $fn=20);
            
            translate([w/2,0,0])
                linear_extrude(3)
                    square([w,diameter],center=true);
        }
    }
}
else if (Select==3) {
    let(w=keystoneBlankWidth()/2) {
        difference() {
            keystoneBlank(center=true);
            cylinder(h=3, d=diameter, $fn=20);
            
            translate([w/-2,0,0])
                linear_extrude(3)
                    square([w,diameter],center=true);
        }
    }
}