
module rectFrame(panelW, panelH, border) {
    difference() {
        square([panelW, panelH]);
        offset(delta=border*-1)
            square([panelW, panelH]);
    }
}

module roundedRect(rectW, rectH, rectR) {
    hull() {
        translate([rectR, rectR])
            circle(r=rectR, $fn=50);

        translate([rectW-rectR, rectR])
            circle(r=rectR, $fn=50);

        translate([rectR, rectH-rectR])
            circle(r=rectR, $fn=50);

        translate([rectW-rectR, rectH-rectR])
            circle(r=rectR, $fn=50);
    }
}

module roundedRectL(rectW, rectH, rectR) {
    hull() {
        translate([rectR, rectR])
            circle(r=rectR, $fn=50);

        translate([rectW-rectR, rectR])
            square(rectR*2, center=true, $fn=50);

        translate([rectR, rectH-rectR])
            circle(r=rectR, $fn=50);

        translate([rectW-rectR, rectH-rectR])
            square(rectR*2, center=true, $fn=50);
    }
}


module roundedRectR(rectW, rectH, rectR) {
    hull() {
        translate([rectR, rectR])
            square(rectR*2, center=true, $fn=50);

        translate([rectW-rectR, rectR])
            circle(r=rectR, $fn=50);

        translate([rectR, rectH-rectR])
            square(rectR*2, center=true, $fn=50);

        translate([rectW-rectR, rectH-rectR])
            circle(r=rectR, $fn=50);
    }
}

module rountedRectFull(rectW, rectH) {
    hull() {  
        translate([rectW/2-rectH/2, 0])
            circle(d=rectH,$fn=20);
            
        translate([-1*(rectW/2-rectH/2), 0])
            circle(d=rectH,$fn=20);
    }
}

module centeredRoundedRect(rectW, rectH, rectR) {
    translate([rectW/-2, rectH/-2])
        roundedRect(rectW, rectH, rectR);
}

module chamferRect(rectW, rectH, rectC) {
    offset(delta=rectC, chamfer=true)
        square([rectW-rectC*2, rectH-rectC*2], center=true);
}
