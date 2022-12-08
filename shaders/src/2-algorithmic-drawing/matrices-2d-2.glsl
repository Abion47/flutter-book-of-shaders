// https://thebookofshaders.com/08/

// Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define PI 3.14159265359

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

mat2 rotate2d(float _angle) {
  return mat2(cos(_angle), -sin(_angle),
              sin(_angle),  cos(_angle));
}

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
  return box(_st, vec2(_size, _size / 4.0)) +
         box(_st, vec2(_size / 4.0, _size));
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(0.0);

  // move space from the center to the vec2(0.0)
  st -= vec2(0.5);
  // rotate the space
  st = rotate2d(sin(u_time) * PI) * st;
  // move it back to the original place
  st += vec2(0.5);

  // Show the coordinates of the space on the background
  // color = vec3(st.x,st.y,0.0);

  // Add the shape on the foreground
  color += vec3(cross(st, 0.4));

  o_fragColor = vec4(color, 1.0);
}