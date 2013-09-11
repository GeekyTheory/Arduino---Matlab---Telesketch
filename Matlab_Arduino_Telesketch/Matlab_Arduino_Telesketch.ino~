/*
     Arduino + Matlab: Telesketch
	
Author: Mario Pérez Esteso - Geeky Theory

Blog: http://www.geekytheory.com

https://www.youtube.com/user/telecoreference
https://twitter.com/geekytheory
https://www.facebook.com/geekytheory
*/

int potenciometroX_pin=0; //Analog 0
int valor_potenciometroX=0;
int potenciometroY_pin=1; //Analog 1
int valor_potenciometroY=0;
void setup(){
  Serial.begin(9600);
}

void loop(){
  valor_potenciometroX=analogRead(potenciometroX_pin);
  Serial.println(valor_potenciometroX);
  valor_potenciometroY=analogRead(potenciometroY_pin);
  Serial.println(valor_potenciometroY);
  delay(100);
}

