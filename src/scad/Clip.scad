include <Settings.scad>

module clip(stick_count = 2, delta_r = 0.25, delta_h = 0.5, 
		tooth_len = 0.75, cutoff = 1, hole = 1.75) {
	hc = stick_count * h + delta_h;
	rc = r2 - delta_r;
	translate([0, 0, rc - cutoff]) rotate([-90, 0, 0])
		difference() {
			union() {
				cylinder(r = rc, h = hc, center = true);
				translate([0, 0, -(hc + h_base) / 2])
					cylinder(r = r3, h = h_base, center = true);
				translate([0, 0, (hc + h_base) / 2]) 
					cylinder(r = rc + tooth_len, h = h_base, center = true);
			}
			translate([0, 2 * rc - cutoff, 0])
				cube([2 * r3, 2 * rc, hc + 2 * h_base + 1], center = true);
			translate([0, -2 * rc + cutoff, 0])
				cube([2 * r3, 2 * rc, hc + 2 * h_base + 1], center = true);
			translate([0, 0, h_base])
				cube([2 * hole, 2 * r3, hc + 2 * h_base], center = true);
		}
}

clip();