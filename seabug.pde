class Seabug {
  private final static int NUM_LEGS = 32;

  private SeabugLeg legs[] = new SeabugLeg[NUM_LEGS];
  
  Seabug(LinearGradient leftLegsGradient, LinearGradient rightLegsGradient) {
    color[] leftLegsColors = leftLegsGradient.getColors(NUM_LEGS);
    color[] rightLegsColors = rightLegsGradient.getColors(NUM_LEGS);
    for (int i = 0; i < this.legs.length; i++) {
      this.legs[i] = new SeabugLeg(leftLegsColors[i], rightLegsColors[i]);
    }
  }
  
  void update(float t) {
    int len = this.legs.length;
    for (int i = 0; i < len; i++) {
      this.legs[i].update(t + i);
    }
  }
  
  void draw() {
    for (SeabugLeg leg: this.legs) {
      leg.draw();
    }
  }
}

class SeabugLeg {
  private final static int POINT_SIZE = 6;
  
  private float x0, y0;
  private float x1, y1;
  private float x2, y2;
  private color c1, c2;
  
  SeabugLeg(color c1, color c2) {
    this.c1 = c1;
    this.c2 = c2;
  }
  
  void update(float t) {
    this.x0 = sin(t/10.0)*100.0 + sin(t/5.0)*20.0 + cos(t/2.0)*3.0;
    this.y0 = cos(t/10.0)*100.0 + sin(t/5.0)*50.0;
    
    this.x1 = sin(t/10.0)*200.0 + sin(t/4.0)*2.0;
    this.y1 = -sin(t/10.0)*200.0 + sin(t/12.0)*20.0;
    
    this.x2 = sin(t/10.0)*200.0 + sin(t/4.0)*2.0;
    this.y2 = cos(t/10.0)*200.0 + sin(t/12.0)*20.0;
  }
  
  void draw() {  
    stroke(c1);
    line(this.x0, this.y0, this.x1, this.y1);
    stroke(c2);
    line(this.x0, this.y0, this.x2, this.y2);
    
    noStroke();
    fill(c1);
    circle(this.x1, this.y1, POINT_SIZE);
    fill(c2);
    circle(this.x2, this.y2, POINT_SIZE);
    fill(255);
    circle(this.x0, this.y0, POINT_SIZE);
  }
}
