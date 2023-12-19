int Out = 3; // The frequency of the PWM signal is approximately 490 Hz (Period = 2ms)
int X = 0;
float Freq = 1; // Frequency of Sinewave
const int Nichols = 1000; // Number of points per period

void setup() {
  Serial.begin(9600);
  // pinMode(Out, 'OUTPUT');
}

void loop() {
if (Serial.available() > 0){
  char WaveVar = Serial.read();
  switch (WaveVar) {
//////////////////////////////////////////////////////////
        case '0': // Square
        {
          while(1){
          analogWrite(Out, 255); delay(100);
          analogWrite(Out, 0); delay(100);          
          
          if (Serial.available() > 0 && Serial.read()!='0'){break;}}
        }
//////////////////////////////////////////////////////////
        case '1': // Sawtooth
        {
          while(1){
          for(X = 0; X < 255; X++){
          analogWrite(Out, X); delay(10);
          }
          
         
          if (Serial.available() > 0 && Serial.read()!='1'){break;}}
        }
//////////////////////////////////////////////////////////         
         case '2': // Ramp
         {
           while(1){          
           for(X = 0; X < 255; X++){ // Rising Slope
           analogWrite(Out, X); delay(10);
           }           
           for(X = 255; X > 0; X--){ // Falling Slope
           analogWrite(Out, X); delay(10);
           }
           
           if (Serial.available() > 0 && Serial.read()!='2'){break;}}
         }
//////////////////////////////////////////////////////////        
        case '3': // Sinewave
       {
          int DeltaT = 1/Freq; // // DeltaT*Nichols = 1/Freq
          
          while(1){          
          for(X = 0; X < Nichols; X++){
          int Val = 1000*sin(2*3.14159*X/Nichols);
          Val = map(Val, -1000, 1000, 0, 255); // Map an analog value ranging between -1000 & 1000 to 8 bits (0 to 255)
          analogWrite(Out, Val);
          delay(DeltaT);
          Serial.println(DeltaT); 
          }
          
          if (Serial.available() > 0 && Serial.read()!='3'){break;}}
        }
}
}
}
