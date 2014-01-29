include <settings.scad>;

module armbone(length, height=h, width=r3, radius2=r2, radius3=r3) {
	difference() {
		union() {
			bar(length, height, width);
			atEnd(length) joint(height, radius3);
		}
		atEnd(length) joint_axis(height, radius2);
	}
}

module humerus()  { armbone(61.9); }
module clavicle() { armbone(50.0); }
module radius()   { armbone(39.4); }
module ulna()     { armbone(39.3); }

translate([0,0,h/2]) {
	translate([0, 30,0]) humerus();
	translate([0, 10,0]) clavicle();
	translate([0,-10,0]) radius();
	translate([0,-30,0]) ulna();
}