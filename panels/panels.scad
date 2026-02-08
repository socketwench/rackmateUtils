include <../BOSL2/std.scad>

module panels_hole() {    
    rect([11, 6], rounding=6/2);
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
            rect([w, 44], rounding=[0,5,5,0], anchor=FRONT+LEFT);
            
            translate([15.875/2,0,0])
                panels_1uHoles();
        }
}

module panels_1uEarRight(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            rect([w, 44], rounding=[5,0,0,5], anchor=FRONT+LEFT);
            
            translate([w-15.875/2,0,0])
                panels_1uHoles();
        }
}

module panels_2uEarLeft(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            rect([w, 88], rounding=[0,5,5,0], anchor=FRONT+LEFT);
            
            translate([15.875/2,0,0])
                panels_2uHoles();
        }
}

module panels_2uEarRight(w=257/2, h=3) {
    linear_extrude(h)
        difference() {
            rect([w, 88], rounding=[5,0,0,5], anchor=FRONT+LEFT);
            
            translate([w-15.875/2,0,0])
                panels_2uHoles();
        }
}
