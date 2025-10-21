include <m3/m3.scad>
include <panels/panels.scad>
include <keystone/keystone.scad>
include <rectangles/rectangles.scad>

innerX=113.6;
innerY=27.8;

Select = 0; // [0:preview, 1:leftEar, 2:leftBody, 3:rightBody, 4:rightEar, 5:bodyFitTest]

module mikrotik_hexPoElite_squarePattern(width, height) {
    translate([width/-2, height/-2]) children();
    translate([width/2, height/-2]) children();
    translate([width/-2, height/2]) children();
    translate([width/2, height/2]) children();
}

module mikrotik_hexPoElite_baseOutline() {
    let(outerX=innerX+7*2, outerY=44) {
        polygon([
            [0,0],
            [0,outerY],
            [outerX/2,outerY],
            [outerX/2,outerY-(outerY-innerY)/2],
            [outerX/2-innerX/2,outerY-(outerY-innerY)/2],
            [outerX/2-innerX/2,(outerY-innerY)/2],
            [outerX/2,(outerY-innerY)/2],
            [outerX/2,0]
        ]);
    }
}

module mikrotik_hexPoElite_supportOutline() {
    let(outerX=innerX+7*2, outerY=44) {
        polygon([
            [0,0],
            [0,outerY],
            [7,outerY],

            [7,outerY-7],
            [outerX/2-7,outerY-7],

            [outerX/2-7,outerY],
            [outerX/2,outerY],
            [outerX/2,outerY-(outerY-innerY)/2],
            [outerX/2-innerX/2,outerY-(outerY-innerY)/2],
            [outerX/2-innerX/2,(outerY-innerY)/2],
            [outerX/2,(outerY-innerY)/2],
            [outerX/2,0],
            [outerX/2-7,0],
            [outerX/2-7,7],
            [7,7],
            [7,0]
        ]);
    }
}

module mikrotik_hexPoElite_holePattern() {
    rotate([0,-90,0])
        translate([(25-7-3)/2+7/2+3,(44-7)/2+7/2])
            mikrotik_hexPoElite_squarePattern(25-7-3,44-7)
                children();
}

module mikrotik_hexPoElite_bodyBlank() {
    union() {
        linear_extrude(3)
            mikrotik_hexPoElite_baseOutline();

        linear_extrude(25)
            mikrotik_hexPoElite_supportOutline();
    }
}

module mikrotik_hexPoElite_leftEarSupport() {
    points = [
        [0,0],
        [0,25],
        [(200-innerX)/-2+23.4+7,9.5],
        [(200-innerX)/-2+23.4+7,0]
    ];

    linear_extrude(3)
        polygon(points);
}

module mikrotik_hexPoElite_rightEarSupport() {
    points = [
        [0,0],
        [0,25],
        [(200-innerX)/-2+23.4+7,9.5],
        [(200-innerX)/-2+23.4+7,0]
    ];
    
    linear_extrude(3)
        polygon(points);
}

module mikrotik_hexPoElite_rightBody() {
    difference() {
        mikrotik_hexPoElite_bodyBlank();
        
        translate([5,0,0])
            mikrotik_hexPoElite_holePattern()
                m3x5x4_ThreadedInsert();

        translate([innerX/2-.2,0,0])
            mikrotik_hexPoElite_holePattern()
                mirror([0,0,1])
                    m3BHCS_counterSinkCutout(7.2, 0.2);
    }
}

module mikrotik_hexPoElite_rightEar() {
    let(earX=(257-(innerX+7*2))/2) {
        difference() {
            union() {
                panels_1uEarLeft(earX, 3);
                
                translate([earX-7,0,0])
                    difference() {
                        cube([7,44,25]);
                        
                        mikrotik_hexPoElite_holePattern()
                            mirror([0,0,1])
                                m3BHCS_counterSinkCutout(7.2, 0.2);
                    }
                        
                translate([(257-innerX)/2-7*2,44/2,0])
                    rotate([90,0,0])
                        mikrotik_hexPoElite_rightEarSupport();
        
                translate([(earX-23.4+7)/2,(44-32.8)/2,0])
                    linear_extrude(9.5)
                        roundedRect(23.4,32.8,3);
            }
        
            translate([((257-(innerX+7*2))/2-(15.5+8.2))/2+7,(44-24.6)/2,9.5])
                rotate([0,90,0])
                    keystoneCutout();
        }
    }
}

module mikrotik_hexPoElite_leftBody() {
    difference() {
        translate([innerX/2+7,0,0])
            mirror([1,0,0])
                mikrotik_hexPoElite_bodyBlank();
        
        translate([5,0,0])
            mikrotik_hexPoElite_holePattern()
                m3x5x4_ThreadedInsert();

        translate([innerX/2,0,0])
            mikrotik_hexPoElite_holePattern()
                mirror([0,0,1])
                    m3BHCS_counterSinkCutout(7.2, 0.2);
    }
}

module mikrotik_hexPoElite_leftEar() {
    let(earX=(257-(innerX+7*2))/2) {
        difference() {
            union() {
                panels_1uEarRight(earX, 3);
                
                difference() {
                    cube([7,44,25]);
                    
                    translate([5,0,0])
                        mikrotik_hexPoElite_holePattern()
                            m3x5x4_ThreadedInsert();
                }
                
                translate([7,44/2,0])
                    rotate([90,0,180])
                        mikrotik_hexPoElite_leftEarSupport();
            
                translate([(earX-23.4-7)/2,(44-32.8)/2,0])
                    linear_extrude(9.5)
                        roundedRect(23.4,32.8,3);
            }
            
            translate([(earX-15.5-7)/2,(44-24.6)/2,9.5])
                rotate([0,90,0])
                    keystoneCutout();
        }
    }
}

module mikrotik_hexPoElite_preview() {
    translate([(257-(innerX+7*2))/-2-0.2,0,0])
        mikrotik_hexPoElite_rightEar();

    mikrotik_hexPoElite_rightBody();

    translate([innerX/2+7.2,0,0])
        mikrotik_hexPoElite_leftBody();

    translate([innerX+14.4,0,0])
        mikrotik_hexPoElite_leftEar();
}

if (Select == 0) {
    mikrotik_hexPoElite_preview();
}
else if (Select == 1) {
    mikrotik_hexPoElite_leftEar();
}
else if (Select == 2) {
    mikrotik_hexPoElite_leftBody();
}
else if (Select == 3) {
    mikrotik_hexPoElite_rightBody();
}
else if (Select == 4) {
    mikrotik_hexPoElite_rightEar();
}
else if (Select == 5) {
    linear_extrude(1)
        mikrotik_hexPoElite_baseOutline();
}

