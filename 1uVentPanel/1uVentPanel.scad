include <../BOSL2/std.scad>
include <../BOSL2/walls.scad>
include <../panels/panels.scad>
include <../m3/m3.scad>
include <../rectangles/rectangles.scad>

Select = 0; // [0:preview, 1:ventPanel, 2:leftEar, 3:rightEar, 4:ventFilter, 5:singlePiece]

module 1uVentPanel_singlePiece() {
    union() {
        panels_1uEarLeft((257-222)/2, 1);

        translate([((257-222)/2)+(222/2),44/2,1/2])
            hex_panel([222, 44, 1], 1.5, 10, frame = 5);

        translate([((257-222)/2)+222,0,0])    
            panels_1uEarRight((257-222)/2, 1);
    }
}

module 1uVentPanel_leftEar() {
    union() {
        panels_1uEarRight(57/2);

        difference() {
            linear_extrude(11)
                square([7,44]);
            
            translate([0,8.3/2,3+9/2])
                rotate([0,90,0])
                    m3x5x4_ThreadedInsert();

            translate([0,44-8.3/2,3+9/2])
                rotate([0,90,0])
                    m3x5x4_ThreadedInsert();
        }
    }
}

module 1uVentPanel_rightEar() {
    union() {
        panels_1uEarLeft(57/2);
        
        translate([57/2-7,0,0]) {
            difference() {
                linear_extrude(11)
                    square([7,44]);
                
                translate([0,8.3/2,3+9/2])
                    rotate([0,90,0])
                        m3BHCS_counterSinkCutout(7, 0.2);

                translate([0,44-8.3/2,3+9/2])
                    rotate([0,90,0])
                        m3BHCS_counterSinkCutout(7, 0.2);

            }
        }
    }
}

module 1uVentPanel_capOutline() {
    polygon([
        [0,0],
        [0,11],
        [7,11],
        [7,4.4],
        [5.8,4],
        [5.8,0]
    ]);
}

module 1uVentPanel_cap() {
    translate([0,44,0])
        rotate([90,0,0])
            union() {
                linear_extrude(44) {
                    1uVentPanel_capOutline();
                }
                
                cube([7,11,1]);
                
                translate([0,0,43])
                    cube([7,11,1]);
            }
}

module 1uVentPanel_panel(anchor=BOTTOM+LEFT+FRONT) {
    difference() {
        union() {
            hex_panel([100, 44, 3], 1.5, 10, frame = 3,anchor=anchor);

            for (x=[0:1:1]) {
                translate([x*(100),0,0])
                    difference() {
                        mirror([x,0,0])
                        1uVentPanel_cap();
                    }
            }
        }

        translate([0,8.3/2,3+9/2])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();

        translate([0,44-8.3/2,3+9/2])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();

        translate([100-7,8.3/2,3+9/2])
            rotate([0,90,0])
                m3BHCS_counterSinkCutout(7, 0.2);

        translate([100-7,44-8.3/2,3+9/2])
            rotate([0,90,0])
                m3BHCS_counterSinkCutout(7, 0.2);
    }
}

module 1uVentPanel_filter() {
    linear_extrude(1) {
        notchedRect([87.4,43.8],[2,1.2]);
    }
}
