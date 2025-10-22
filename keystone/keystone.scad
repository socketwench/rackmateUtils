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

function keystoneWidth() = 15.2;
function keystoneHeight() = 24.6;
function keystoneDepth() = 9.5;

module keystoneCutout(center=false) {
    let(w=keystoneWidth(), h=keystoneHeight(), z=keystoneDepth()) {
        translate([center ? w/-2 : 0,center ? h/-2 : 0,center ? z : 0])
            rotate([0,center ? 90 : 0,0])
                linear_extrude(w) 
                    polygon(keystonePoints());
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
