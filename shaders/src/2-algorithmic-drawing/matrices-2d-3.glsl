// https://thebookofshaders.com/08/

// Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets
#define PI 3.14159265359

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

mat2 scale(vec2 _scale) {
  return mat2(_scale.x, 0.0,
              0.0, _scale.y);
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
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  vec3 color = vec3(0.0);

  st -= vec2(0.5);
  st = scale(vec2(sin(u_time) + 1.0)) * st;
  st += vec2(0.5);

  // Show the coordinates of the space on the background
  // color = vec3(st.x,st.y,0.0);

  // Add the shape on the foreground
  color += vec3(cross(st,0.2));

  o_fragColor = vec4(color,1.0);
}