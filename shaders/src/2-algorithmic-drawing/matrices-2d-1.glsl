// https://thebookofshaders.com/08/

// Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

float box(in vec2 _st, in vec2 _size) {
  _size = vec2(0.5) - _size * 0.5;
  vec2 uv = smoothstep(_size,
                      _size + vec2(0.001),
                      _st);
  uv *= smoothstep(_size,
                  _size + vec2(0.001),
                  vec2(1.0) - _st);
  return uv.x * uv.y;
}

float cross(in vec2 _st, float _size) {
  return box(_st, vec2(_size, _size / 4.0))
       + box(_st, vec2(_size / 4.0, _size));
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(0.0);

  // To move the cross we move the space
  vec2 translate = vec2(cos(u_time), sin(u_time));
  st += translate * 0.35;

  // Show the coordinates of the space on the background
  // color = vec3(st.x,st.y,0.0);

  // Add the shape on the foreground
  color += vec3(cross(st, 0.25));

  o_fragColor = vec4(color, 1.0);
}