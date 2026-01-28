include <../m3/m3.scad>

module iecInletCutoutShape() {
    polygon([
        [-28.2/2,-48.8/2],
        [28.2/2,-48.8/2],
        [28.2/2,48.8/2-4.8],
        [28.2/2-4.8,48.8/2],
        [-28.2/2+4.8,48.8/2],
        [-28.2/2,48.8/2-4.8]
    ]);
}

module iecInletCutout() {
    union() {
        translate([-40/2,0,0]) m3x5x4_ThreadedInsert();
        translate([40/2,0,0]) m3x5x4_ThreadedInsert();
        
        translate([0,1.6,0])
            linear_extrude(35)
                iecInletCutoutShape();
    }
}

module iecInletShield(h) {
    translate([0,1.6,0]) difference() {
        linear_extrude(h)
            offset(delta=2) 
                iecInletCutoutShape();
        
        linear_extrude(h) 
            iecInletCutoutShape();
    }
}
