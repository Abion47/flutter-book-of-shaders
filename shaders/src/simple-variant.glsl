#ifdef GL_ES
  precision highp float;
#endif

// Inputs
uniform float a;

// Output
out vec4 fragColor;

// Program
void main() {
  fragColor = vec4(0.0, a, 0.0, 1.0);
}