#include "FastLED.h"

#if FASTLED_VERSION < 3001000
#error
#endif

#define BRIGHTNESS  20

#define BUTTON_PIN  2
#define UPDATES_PER_SECOND 100

#define RGB(r,g,b)  CRGB(g, r, b)

#define C1 RGB(77,191,57)
#define C2 RGB(191,57,156)

CRGBArray<30> leds;

void setup() {
  delay(2000);
  FastLED.addLeds<WS2811, 3>(leds, 0, 30);
  FastLED.setBrightness(BRIGHTNESS);
  pinMode(BUTTON_PIN, INPUT_PULLUP);
}

void loop() {
  Red_light();
  FastLED.delay(10000);
}

void Red_light() {
  leds(0,9).fill_solid(C1);
  leds(10,18).fill_solid(C2);
  leds(19,30).fill_solid(C1);
}

