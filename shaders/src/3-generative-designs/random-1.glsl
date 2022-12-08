// https://thebookofshaders.com/10/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

float random (vec2 st) {
  return fract(sin(dot(st.xy,
                       vec2(12.9898, 78.233)))
               * 43758.5453123);
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;

  float rnd = random(st);

  o_fragColor = vec4(vec3(rnd), 1.0);
}