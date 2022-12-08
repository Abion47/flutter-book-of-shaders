#include <flutter/runtime_effect.glsl>

#ifndef FLUTTER_Y_AXIS_SCALE

  #define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets

#endif

#ifndef METAL_FRAG_COORD

  #define METAL_FRAG_COORD 1

  vec2 fl_FragCoord(vec2 size) {
    vec2 fragCoord = FlutterFragCoord().xy;

    #if FLUTTER_Y_AXIS_SCALE < 0
    fragCoord.y = size.y - fragCoord.y; // Flip y axis for Metal targets
    #endif

    return fragCoord;
  }

#endif