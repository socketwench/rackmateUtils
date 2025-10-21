include <../rectangles/rectangles.scad>

module panels_hole() {
    rountedRectFull(11, 6);
}

module panels_1uHoles(pattern=[true,true,true]) {
    for(i=[0:1:2]) {
        if (pattern[i]) {
            translate([0,6.15+i*15.875,0])
                panels_hole();
        }
    }
}

module panels_2uHoles(patternLower=[true,true,true], patternUpper=[true,true,true]) {
    panels_1uHoles(patternLower);
    
    translate([0,44.5,0])
        panels_1uHoles(patternUpper);
}

module panels_1uEar(w=257/2, h=3) {
    panels_1uEarLeft(w, h);
}

module panels_1uEarLeft(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            roundedRectL(w, 44, 5);
            
            translate([15.875/2,0,0])
                panels_1uHoles();
        }
}

module panels_1uEarRight(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            roundedRectR(w, 44, 5);
            
            translate([w-15.875/2,0,0])
                panels_1uHoles();
        }
}

module panels_2uEarLeft(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            roundedRectL(w, 88, 5);
            
            translate([15.875/2,0,0])
                panels_2uHoles();
        }
}

module panels_2uEarRight(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            roundedRectR(w, 88, 5);
            
            translate([w-15.875/2,0,0])
                panels_2uHoles();
        }
}
