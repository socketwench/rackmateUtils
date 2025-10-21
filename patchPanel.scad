//include <BOSL2/std.scad>
//include <BOSL2/walls.scad>
include <panels/panels.scad>
include <keystone/keystone.scad>
include <m3/m3.scad>


Select = 0; // [0:preview, 1:patchPanel, 2:leftEar, 3:rightEar]

module psuBrickEar_leftEar() {
    union() {
        panels_1uEarRight(57/2);

        difference() {
            linear_extrude(11)
                square([7,44]);
            
            translate([0,8.3/2,3+7/2])
                rotate([0,90,0])
                    m3x5x4_ThreadedInsert();

            translate([0,44-8.3/2,3+7/2])
                rotate([0,90,0])
                    m3x5x4_ThreadedInsert();
        }
    }
}

module psuBrickEar_rightEar() {
    union() {
        panels_1uEarLeft(57/2);
        
        translate([57/2-7,0,0]) {
            difference() {
                linear_extrude(11)
                    square([7,44]);
                
                translate([0,8.3/2,3+7/2])
                    rotate([0,90,0])
                        m3BHCS_counterSinkCutout(7, 0.2);

                translate([0,44-8.3/2,3+7/2])
                    rotate([0,90,0])
                        m3BHCS_counterSinkCutout(7, 0.2);

            }
        }
    }
}

module patchPanel_panel() {
    difference() {
        let(minWidth=9.5+3.5*2, count=floor((100-3.5)/minWidth)) {
            difference() {
                union() {
                    linear_extrude(3)
                        square([100,44]);

                    linear_extrude(11)
                        polygon([
                            [0,0],
                            [0,44],
                            [7,44],
                            [7,44-8.3],
                            [100-7,44-8.3],
                            [100-7,44],
                            [100,44],
                            [100,0],
                            [100-7,0],
                            [100-7,8.3],
                            [7,8.3],
                            [7,0],
                        ]);
                }
                
                for (i = [0:1:count-1]) {
                    translate([3.5+(((100-3.5/2)/count)*i),(44-24.6)/2,9.5])
                        rotate([0,90,0])
                            keystoneCutout();
                }
                
                translate([0,0,9.5])
                    linear_extrude(11-9.5)
                        polygon([
                            [0,8.3],
                            [0,44-8.3],
                            [100,44-8.3],
                            [100,8.3]
                        ]);
            }
        }

        translate([0,8.3/2,3+7/2])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();

        translate([0,44-8.3/2,3+7/2])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();

        translate([100-7,8.3/2,3+7/2])
            rotate([0,90,0])
                m3BHCS_counterSinkCutout(7, 0.2);

        translate([100-7,44-8.3/2,3+7/2])
            rotate([0,90,0])
                m3BHCS_counterSinkCutout(7, 0.2);
    }
}

module patchPanel_preview() {
    translate([100.2,0,0]) psuBrickEar_leftEar();
    patchPanel_panel();
    translate([-57/2-0.2,0,0]) psuBrickEar_rightEar();
}
    

if (Select == 0) {
    patchPanel_preview();
}
else if (Select == 1) {
    patchPanel_panel();
}
else if (Select == 2) {
    psuBrickEar_leftEar();
}
else if (Select == 3) {
    psuBrickEar_rightEar();
}
