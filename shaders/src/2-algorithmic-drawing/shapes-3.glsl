// https://thebookofshaders.com/07/

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

float circle(in vec2 _st, in float _radius) {
  vec2 dist = _st - vec2(0.5);
  return 1.0 - smoothstep(_radius - (_radius * 0.01),
                          _radius + (_radius * 0.01),
                          dot(dist, dist) * 4.0);
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(circle(st, 0.9));

  o_fragColor = vec4(color, 1.0);
}