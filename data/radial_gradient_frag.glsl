#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform vec2 iCenter;
uniform float iThreshold;
uniform vec2 iResolution;
uniform vec4 iStartColor;
uniform vec4 iEndColor;

void main() {
    vec2 uv = gl_FragCoord.xy;
    float dist = distance(iCenter, uv);
    float t = (0.5 - dist/iResolution.x) * iThreshold;
    t = clamp(t, 0.0, 1.0);
    gl_FragColor = mix(iStartColor, iEndColor, t);
}