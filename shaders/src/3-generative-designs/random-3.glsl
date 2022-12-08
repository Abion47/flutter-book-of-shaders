// https://thebookofshaders.com/10/

// Author @patriciogv - 2015
// Title: Truchet - 10 print

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define PI 3.14159265358979323846

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

float random (vec2 st) {
  return fract(sin(dot(st.xy,
                       vec2(12.9898, 78.233)))
               * 43758.5453123);
}

vec2 truchetPattern(in vec2 _st, in float _index) {
  _index = fract(((_index - 0.5) * 2.0));
  if (_index > 0.75) {
    _st = vec2(1.0) - _st;
  } else if (_index > 0.5) {
    _st = vec2(1.0 - _st.x, _st.y);
  } else if (_index > 0.25) {
    _st = 1.0 - vec2(1.0 - _st.x, _st.y);
  }
  return _st;
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  st *= 10.0;
  // st = (st - vec2(5.0)) * (abs(sin(u_time * 0.2)) * 5.0);
  // st.x += u_time * 3.0;

  vec2 ipos = floor(st);  // integer
  vec2 fpos = fract(st);  // fraction

  vec2 tile = truchetPattern(fpos, random(ipos));

  float color = 0.0;

  // Maze
  color = smoothstep(tile.x - 0.3, tile.x, tile.y) -
          smoothstep(tile.x, tile.x + 0.3, tile.y);

  // Circles
  // color = (step(length(tile), 0.6) -
  //          step(length(tile), 0.4)) +
  //         (step(length(tile - vec2(1.0)), 0.6) -
  //          step(length(tile - vec2(1.0)), 0.4));

  // Truchet (2 triangles)
  // color = step(tile.x, tile.y);

  o_fragColor = vec4(vec3(color), 1.0);
}