// https://thebookofshaders.com/09/

// Author @patriciogv - 2015

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

float circle(in vec2 _st, in float _radius){
    vec2 l = _st - vec2(0.5);
    return 1.0 - smoothstep(_radius - (_radius * 0.01),
                            _radius + (_radius * 0.01),
                            dot(l, l) * 4.0);
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(0.0);

  st *= 3.0;      // Scale up the space by 3
  st = fract(st); // Wrap around 1.0

  // Now we have 9 spaces that go from 0-1

  color = vec3(st, 0.0);
  //color = vec3(circle(st, 0.5));

  o_fragColor = vec4(color, 1.0);
}