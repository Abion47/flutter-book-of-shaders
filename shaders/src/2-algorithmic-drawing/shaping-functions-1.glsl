// https://thebookofshaders.com/05/

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st) {    
  return smoothstep(0.02, 0.0, abs(st.y - st.x));
}


// Main Program
void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  float y = st.x;
  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(st);
  color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

  o_fragColor = vec4(color, 1.0);
}