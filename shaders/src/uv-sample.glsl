#version 450

#include <flutter/runtime_effect.glsl>

layout(location = 0) uniform vec2 uSize;

layout(location = 0) out vec4 fragColor;

void main() {
  vec2 pos = FlutterFragCoord().xy / uSize;
  fragColor = vec4(pos, 0.0, 1.0);
}