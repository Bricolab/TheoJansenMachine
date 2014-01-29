include <settings.scad>;

module barV(length, height=h, width=r3) { cube(size=[length*2, width, height], center=true); }

module barH(length, height=h, width=r3) { cube(size=[width, length, height], center=true); }

module atEnd(length1, length2) { atPoints3([0, length2, 0], [length1, 0, 0], [-length1, 0, 0]) child(); }


module vertebra(length1, length2, height=h, width=r3, radius2=r2, radius3=r3) {
	difference() {
		union() {
			barV(length1, height, width);
			translate([0, length2/2, 0]) barH(length2, height, width);
			atEnd(length1, length2) joint(height, radius3);
		}
		atEnd(length1, length2) joint_axis(height, radius2);
	}
}

module spine() { vertebra(38.0, 7.8); }

translate([0, 0, h/2]) {
	spine();
}