// https://thebookofshaders.com/05/

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

float plot(vec2 st, float pct){
  return smoothstep(pct-0.02, pct     , st.y) -
         smoothstep(pct     , pct+0.02, st.y);
}

// Main Program
void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  // Smooth interpolation between 0.1 and 0.9
  float y = smoothstep(0.1, 0.9, st.x);

  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(st,y);
  color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

  o_fragColor = vec4(color, 1.0);
}
