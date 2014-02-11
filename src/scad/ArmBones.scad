include <settings.scad>;

module armbone(length, height=h, width=r3, radius2=r2, radius3=r3) {
	difference() {
		union() {
			translate([0,-width/2,0]) bar(length, height, width);
			atEnd(length) joint(height, radius3);
		}
		atEnd(length) joint_axis(height, radius2);
	}
}

module disym_armbone(length, height=h, width=r3, radius2=r2, radius3=r3) {
	difference() {
		union() {
			translate([0,-width/2,0]) bar(length*0.8, height, width);
			translate([length*0.7,-width/2,0]) bar(length*0.3, height/2, width);
			translate([0,0,0]) joint(height, radius3);
			translate([length,0,0]) joint(height/2, radius3);
		}
		atEnd(length) joint_axis(height, radius2);
	}
}


module humerus()  { disym_armbone(61.9); }
module clavicle() { disym_armbone(50.0); }
module radius()   { armbone(39.4); }
module ulna()     { armbone(39.3); }

at(0, 2) humerus();
at(0, 0.75) clavicle();
at(0,-0.75) radius();
at(0,-2) ulna();
