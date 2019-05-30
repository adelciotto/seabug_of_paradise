final color BACKGROUND_GRADIENT_START_COLOR = #141e30;
final color BACKGROUND_GRADIENT_END_COLOR = #243b55;
final color SEABUG_LEFT_GRADIENT_START_COLOR = #00f260;
final color SEABUG_LEFT_GRADIENT_END_COLOR = #0575e6;
final color SEABUG_RIGHT_GRADIENT_START_COLOR = #ff6a00;
final color SEABUG_RIGHT_GRADIENT_END_COLOR = #ee0979;
final float ANIMATION_SPEED = 8;
final float HORIZONTAL_OSCILLATION_AMPLITUDE = 128;
final float HORIZONTAL_OSCILLATION_AMPLITUDE_TIME_PERIOD = 240;

RadialGradient radialGradient;
int lastTime = 0;
float t = 0;
float currentCenterX = 0;
Seabug seabug;

void setup() {
  fullScreen(P2D);
  noCursor();
  radialGradient = new RadialGradient(width/2, height/2, BACKGROUND_GRADIENT_START_COLOR, BACKGROUND_GRADIENT_END_COLOR);
  seabug = new Seabug(
    new LinearGradient(SEABUG_LEFT_GRADIENT_START_COLOR, SEABUG_LEFT_GRADIENT_END_COLOR),
    new LinearGradient(SEABUG_RIGHT_GRADIENT_START_COLOR, SEABUG_RIGHT_GRADIENT_END_COLOR)
  );
}

void update() {  
  int currentTime = millis();
  float deltaTime = float(currentTime - lastTime) * 0.001;
  lastTime = currentTime;
  
  t += ANIMATION_SPEED * deltaTime;
  currentCenterX = HORIZONTAL_OSCILLATION_AMPLITUDE * sin(TWO_PI * t/HORIZONTAL_OSCILLATION_AMPLITUDE_TIME_PERIOD);
  seabug.update(t);
}

void draw() {
  update();
  
  radialGradient.setCenterX(width/2 + currentCenterX);
  radialGradient.draw();
  
  pushMatrix();
  translate(width/2, height/2);
  translate(currentCenterX, 0);
  scale(2.0, 2.0);
  seabug.draw();
  popMatrix();
}
