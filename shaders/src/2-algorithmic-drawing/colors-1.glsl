// https://thebookofshaders.com/06/

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform float u_time;

// Output
out vec4 o_fragColor;

vec3 colorA = vec3(0.149, 0.141, 0.912);
vec3 colorB = vec3(1.000, 0.833, 0.224);

void main() {
  vec3 color = vec3(0.0);

  float pct = abs(sin(u_time));

  // Mix uses pct (a value from 0-1) to
  // mix the two colors
  color = mix(colorA, colorB, pct);

  o_fragColor = vec4(color,1.0);
}
