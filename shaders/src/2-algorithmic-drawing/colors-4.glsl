// https://thebookofshaders.com/06/

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets
#define TWO_PI 6.28318530718

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb(in vec3 c) {
  vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0.0, 4.0, 2.0), 6.0)
                        - 3.0)
                    - 1.0,
                    0.0,
                    1.0);
  rgb = rgb * rgb * (3.0 - 2.0 * rgb);
  return c.z * mix(vec3(1.0), rgb, c.y);
}

void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  vec3 color = vec3(0.0);

  // Use polar coordinates instead of cartesian
  vec2 toCenter = vec2(0.5) - st;
  float angle = atan(toCenter.y, toCenter.x);
  float radius = length(toCenter) * 2.0;

  // Map the angle (-PI to PI) to the Hue (from 0 to 1)
  // and the Saturation to the radius
  color = hsb2rgb(vec3((angle / TWO_PI) + 0.5, radius, 1.0));

  o_fragColor = vec4(color, 1.0);
}