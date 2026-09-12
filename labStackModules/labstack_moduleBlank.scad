include <../BOSL2/std.scad>

module labstack_moduleHolePattern() {
    for (x = [-12.9:25.8:12.9]) {
        for (y = [-40.1:80.2:40.1]) {
            translate([x,y,0])
                children();
        }
    }
}

module labstack_moduleBlank() {
    difference() {
        diff()
            cuboid([54,87,3], rounding=5, edges=[LEFT+FRONT, RIGHT+FRONT, LEFT+BACK, RIGHT+BACK], anchor=BOTTOM) {
                edge_mask([BOTTOM+LEFT, BOTTOM+RIGHT])
                    chamfer_edge_mask(l=87, chamfer=2.1213);
            }

        labstack_moduleHolePattern()
            cylinder(h=3, d=3.6, $fn=20);
    }
}
