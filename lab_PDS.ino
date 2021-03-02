const int ledPIN = 9;
byte Pxf=0;
 
void setup(){
  Serial.begin(9600);
  pinMode(ledPIN , OUTPUT); 
}
 
void loop(){
  if (Serial.available()>0){     //si existe información pendiente
    Pxf = Serial.read();            //leeemos la opcion

     if (Pxf <= 300){     
      digitalWrite(ledPIN , HIGH);
      delay(1);
     }
      digitalWrite(ledPIN , LOW);
      delay(1);
  }
}
