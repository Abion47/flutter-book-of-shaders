// https://thebookofshaders.com/06/

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets
#define PI 3.14159265359

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

vec3 colorA = vec3(0.149, 0.141, 0.912);
vec3 colorB = vec3(1.000, 0.833, 0.224);

float plot (vec2 st, float pct) {
  return smoothstep( pct - 0.01, pct, st.y) -
         smoothstep( pct, pct + 0.01, st.y);
}

void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  vec3 color = vec3(0.0);

  vec3 pct = vec3(st.x);

  // Experiment with uncommenting one or more of the following lines
  // pct.r = smoothstep(0.0, 1.0, st.x);
  // pct.g = sin(st.x * PI);
  // pct.b = pow(st.x, 0.5);

  color = mix(colorA, colorB, pct);

  // Plot transition lines for each channel
  color = mix(color, vec3(1.0, 0.0, 0.0), plot(st, pct.r));
  color = mix(color, vec3(0.0, 1.0, 0.0), plot(st, pct.g));
  color = mix(color, vec3(0.0, 0.0, 1.0), plot(st, pct.b));

  o_fragColor = vec4(color,1.0);
}