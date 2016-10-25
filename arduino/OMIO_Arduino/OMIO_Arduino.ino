#include <SoftwareSerial.h>

void setup()  
{
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }
}

void loop() // run over and over
{
  int b;
  
  if (Serial.available())
  {
    b = Serial.read();
    
    if (b == 'T')
      Serial.write("28.0");
    
    delay(1000);
  }
}

