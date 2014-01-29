include <Settings.scad>

//
//          p3
//          *
//         / \
//      b /   \ a
//       /     \
//      /       \
//     *---------*
//    p1    c    p2
//
module phalange(a=49.0, b=65.7, c=36.7, height=h, radius2=r2, radius3=r3) {
	h = height;

	alpha = acos((b*b + c*c - a*a) / (2*b*c));

	p1 = [0, 0];
    p2 = [c, 0];
    p3 = [cos(alpha)*b, sin(alpha)*b];

	P1 = [0, 0, 0];
    P2 = [c, 0, 0];
    P3 = [cos(alpha)*b, sin(alpha)*b, 0];

	difference() {
		union() {
			translate([0,0,-height/2]) {
				linear_extrude(height=height) {
					polygon(points=[p1,p2,p3]);
				}
			}
	
			atPoints2(P1,P2) joint(height, radius3);
		}
		atPoints2(P1,P2) joint_axis(height, radius2);
	}
}

translate([0,0,height/2]) {
	phalange();
}