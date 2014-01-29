include <settings.scad>;

module outer_joint(stick_count = 2, delta_r = 0.4, delta_h = 0.25) {
	dh = delta_h * stick_count;
	difference() {
		translate([0, 0, h_base]) cylinder(r = r2 - delta_r, h = stick_count * h + dh);
		translate([0, 0, h_base - 1]) cylinder(r = r1, h = stick_count * h + dh + 2);
	}
	cylinder(r = r3, h = h_base);
}

module outer_sqjoint(stick_count = 2, delta_r = 0.4, delta_h = 0.25) {
	dh = delta_h * stick_count;
	side = cos(45) * r2 * 2 - delta_r;
	height = h * stick_count + dh;
	difference() {
//		translate([0, 0, h_base]) cylinder(r = r2 - delta_r, h = stick_count * h + dh);
		translate([0, 0, h_base + height/2]) cube([side, side, height], center=true);//cylinder(r = r2 - delta_r, h = stick_count * h + dh);
		translate([0, 0, h_base - 1]) cylinder(r = r1, h = stick_count * h + dh + 2);
	}
	cylinder(r = r3, h = h_base);
}

module inner_joint(stick_count = 2, delta_r = 0.65) {
	translate([0, 0, h_base]) cylinder(r = r1 - delta_r, h = stick_count * h);
	cylinder(r = r3, h = h_base);
}

module stick(length) {
	difference() {
		union() {
			translate([0, -r3, 0]) cube([length, 2 * r3, h]);
			cylinder(r = r3, h = h);
			translate([length, 0, 0]) cylinder(r = r3, h = h);
		}
		cylinder(r = r2, h = h);
		translate([length, 0, 0]) cylinder(r = r2, h = h);
	}
}

// best sizes found so far
outer_joint();
at(1, 0) inner_joint();
at(2, 0) outer_sqjoint();

// things to test for better fit between the joint and the sticks
//at(0, 1) outer_joint(delta_h = 0.25);
//at(1, 1) outer_joint(delta_r = 0.35);
//at(2, 1) outer_joint(delta_r = 0.35, delta_h = 0.25);