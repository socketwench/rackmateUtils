include <panels/panels.scad>
include <rectangles/rectangles.scad>
include <m3/m3.scad>
include <BOSL2/std.scad>
include <BOSL2/walls.scad>

Select = 0; // [0:rackEar, 1:fitTest]
Side = 0; // [0:Right, 1:Left]

pfSenseWidth=134;
pfSenseHeight=41.2;

ventXOffset=13.7;
ventYOffset=8.4;

module pfSense_gs2220_ear() {
    panels_1uEarLeft((257-pfSenseWidth)/2);
}

module pfSense_gs2220_insertPattern() {
    translate([ventXOffset+4.8/2,ventYOffset+4.8/2,0]) {
        let(xdiff=23,ydiff=20) {
            translate([0,0])
                children();
            translate([xdiff,0])
                children();
            translate([0,ydiff])
                children();
            translate([xdiff,ydiff])
                children();
        }
    }
}

module pfSense_gs2220_bodyMountShape() {
    difference() {
            roundedRectR(ventXOffset+4.8+23+ventYOffset/2,38,3);
        translate([7,8,0])
            circle(d=6.4, $fn=20);

    }
}

module pfSense_gs2220_fitTest() {
    difference() {
        linear_extrude(1) {
            pfSense_gs2220_bodyMountShape();
        }

        pfSense_gs2220_insertPattern()
            m3x5x4_ThreadedInsert();
    }
}

module pfSense_gs2220_bodyMount() {
    difference() {
        linear_extrude(6) {
            pfSense_gs2220_bodyMountShape();
        }

        pfSense_gs2220_insertPattern()
            m3x5x4_ThreadedInsert();
    }
}

module pfSense_gs2220_support() {
    points = [
        [0,ventXOffset+4.8+23+ventYOffset/2],
        [0,0],
        [(200-pfSenseWidth)/-2,0]
    ];
    
    hex_panel(points, 1.5, 10, h = 3, frame = 5);
}

module pfSense_gs2220() {
    union() {
        pfSense_gs2220_ear();

        translate([(257-pfSenseWidth)/2,(44-38)/2,0])
            rotate([0,-90,0])
                pfSense_gs2220_bodyMount();
        
        translate([(257-pfSenseWidth)/2-6,44/2,0])
            rotate([90,0,0])
                pfSense_gs2220_support();
    }
}

if (Select == 0) {
    mirror([Side,0,0])
        pfSense_gs2220();
}
else if (Select == 1) {
    mirror([Side,0,0])
        pfSense_gs2220_fitTest();
}

