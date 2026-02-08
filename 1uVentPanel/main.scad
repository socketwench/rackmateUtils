include <1uVentPanel.scad>

Select = 0; // [0:preview, 1:ventPanel, 2:leftEar, 3:rightEar, 4:ventFilter, 5:singlePiece]

module 1uVentPanel_preview() {
    translate([100.2,0,0]) 1uVentPanel_leftEar();
    1uVentPanel_panel();
    translate([-57/2-0.2,0,0]) 1uVentPanel_rightEar();
}

if (Select == 0) {
    1uVentPanel_preview();
}
else if (Select == 1) {
    1uVentPanel_panel();
}
else if (Select == 2) {
    1uVentPanel_leftEar();
}
else if (Select == 3) {
    1uVentPanel_rightEar();
}
else if (Select == 4) {
    1uVentPanel_filter();
    echo("Print this with open top and bottom in a 40% gyroid infill");
}
else if (Select == 5) {
    1uVentPanel_singlePiece();
}
