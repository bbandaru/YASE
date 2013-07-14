void rX(inout vec3 p, float t) {
	float c = cos(t), s = sin(t); vec3 q = p;
	p.y = c * q.y - s * q.z;
	p.z = s * q.y + c * q.z;
}
void rY(inout vec3 p, float t) {
	float c = cos(t), s = sin(t); vec3 q = p;
	p.x = c * q.x + s * q.z;
	p.z = -s * q.x + c * q.z;
}
void rZ(inout vec3 p, float t) {
	float c = cos(t), s = sin(t); vec3 q = p;
	p.x = c * q.x - s * q.y;
	p.y = s * q.x + c * q.y;
}

void stepPos(in float i, in vec4 prevPos, in vec4 pos, out vec4 nextPos) {
	float n = 256.;
  float e = floor(count / n);
  float j = floor(i / e);
  float k = mod(i, e);
  float t = k / e;
  float s = j / n;
  float srs = sqrt(s);

	vec3 c = rand3(j) * srs * 2.;
  float rad = t - .5;
  vec3 p = vec3(rad, 0., 0.);
  float tm = time * .25;
	p *= mix(.1, .75, srs);
  p += c;
  rZ(p, tm * .1 * (mod(j, 2.) - .5));

  nextPos.xyz = p;
 	nextPos.w = rand(j) * (1. - cos(t * PI * 2.));
}