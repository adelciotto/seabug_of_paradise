class RadialGradient {
  private final static float THRESHOLD = 2.0;
  
  private float centerX, centerY;
  private PShader shader;
  
  RadialGradient(float centerX, float centerY, color start, color end) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.shader = loadShader("radial_gradient_frag.glsl");
   
    this.shader.set("iCenter", this.centerX, this.centerY);
    this.shader.set("iThreshold", THRESHOLD);
    this.shader.set("iResolution", float(width), float(height));
    this.shader.set("iStartColor", red(start)/255.0, green(start)/255.0, blue(start)/255.0, alpha(start)/255.0);
    this.shader.set("iEndColor",  red(end)/255.0, green(end)/255.0, blue(end)/255.0, alpha(end)/255.0);
  }
  
  void setCenterX(float centerX) {
    this.centerX = centerX;
    this.shader.set("iCenter", this.centerX, this.centerY);
  }
  
  void draw() {
    background(0, 0, 0);
    filter(this.shader);
  }
}
