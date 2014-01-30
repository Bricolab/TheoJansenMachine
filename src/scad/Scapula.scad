include <settings.scad>;

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
module scapula(a=40.1, b=55.8, c=41.5, height=h, radius2=r2, radius3=r3) {
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
			linear_extrude(height=height) {
				polygon(points=[p1,p2,p3]);
			}
	
			atPoints3(P1,P2,P3) joint(height, radius3);
		}
		atPoints3(P1,P2,P3) joint_axis(height, radius2);
	}
}

scapula();
