#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
out vec4 fragColor;

void main() {
  vec2 pos = FlutterFragCoord().xy / uSize;
  fragColor = vec4(pos, 0.0, 1.0);
}