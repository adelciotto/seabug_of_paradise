class LinearGradient {
  private color startColor;
  private color endColor;
  
  LinearGradient(color start, color end) {
    this.startColor = start;
    this.endColor = end;
  }
  
  color[] getColors(int stops) {
    color colors[] = new color[stops];
    float stepFactor = 1.0 / float(stops-1);
    
    for (int i = 0; i < stops; i++) {
      float t = stepFactor * float(i);
      colors[i] = lerpColor(this.startColor, this.endColor, t);
    }
    
    return colors;
  }
}
