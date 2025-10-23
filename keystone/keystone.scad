function keystonePoints() = [
    [0,2],
    [1.4,2],
    [1.4,0],    
    [7.6,0],
    [9.5,2],
    [9.5,18.8],
    [4.6,24.6],
    [1.4,24.6],
    [1.4,22.6],
    [0,22.6],
];

function keystoneBlankPoints() = [
    [0,0],
    [0,16.2],
    [16.8,16.2],
    [16.8,17.7],
    [5.5,17.7],
    [5.5,19.1],
    [8.5,20.5],
    [8.5,19.3],
    [10.5,19.3],
    [10.5,20.5],
    [12.5,20.5],
    [12.5,19.3],
    [19,19.3],
    [19,14.8],
    [2.8,14.8],
    [2.8,1.6],
    [12.5,1.6],
    [12.5,-1.2],
    [10.5,-1.2],
    [10.5,0],
    [8.5,0],
    [8.5,-1.2],
    [5.5,0],
];

function keystoneWidth() = 15.2;
function keystoneHeight() = 24.6;
function keystoneDepth() = 9.5;

function keystoneBlankWidth() = 14.5;

module keystoneCutout(center=false) {
    let(w=keystoneWidth(), h=keystoneHeight(), z=keystoneDepth()) {
        translate([center ? w/-2 : 0,center ? h/-2 : 0,center ? z : 0])
            rotate([0,center ? 90 : 0,0])
                linear_extrude(w) 
                    polygon(keystonePoints());
    }
}

module keystoneBlank(center=false) {
    // The centering here is on the blank face, rather than the 
    // entire geometry. This makes it easier to mod.
    let(w=keystoneBlankWidth(), h=16.2, z=0) {
        translate([center ? w/2 : 0,center ? h/-2 : 0,center ? z : 0])
            rotate([0,center ? -90 : 0,0])
                linear_extrude(w) 
                    polygon(keystoneBlankPoints());
    }
}

module keystonePort(border=4.1, center=false) {
    let(w=keystoneWidth(), h=keystoneHeight(), z=keystoneDepth()) {
        translate([center ? 0 : 4,center ? 0 : 4,0]) difference() {
            linear_extrude(z)
                offset(delta=border, chamfer=true)
                    square([w,h], center=center);
            
            translate([center ? 0 : w,0,0])
                rotate([0,center ? 0 : -90,0])
                    keystoneCutout(center);
        }
    }
}
