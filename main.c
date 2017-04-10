#include <avr/io.h>
#include <util/delay.h>
#include "USART.h"

/**
   TODO: 
   press_button byte 
   release_button byte 
   add internal increment to repeat button press with a delay. 
   so while button is being pressed keep sending command.
   
   Notes: Host side application is over all done. Currently, there is no way to keep sending a byte to the host via transmitbyte. But as a pure toggle this works perfectly. 

   TODO for host app: 
   - user defined keybind via commandline
   - compile C sources for luars232 and uinput lua libraries to useable lua files. 

**/

/**   First PIN argument is the PORT pin e.g. PIND or PINB 
      which really means the pin port. 
      _pNum  argument is a reference to the actual Pin number on the PORT
      e.g. PD7 or PB2
      @NOTE currently I am using PIND and PD7 as my port and pin for button presses. 
**/

int buttonPressed(int _PIN,int _pNum){
  
  if (bit_is_clear(_PIN,_pNum)) {
    _delay_us(1000);
    if (bit_is_clear(_PIN,_pNum)) {
      return(1);
    }

  }
  return 0;
} 


int main(int argc, char *argv[]){

  uint8_t bPressed;
  initUSART();
  DDRB = 0xff;
  PORTD |= _BV(7);

  while (1) {

    //## button block PIND, PD7

    if (buttonPressed(PIND,PD7)) {

      if (bPressed == 0 ) {
	
	PORTB |= _BV(0);
	bPressed = 1;
	transmitByte('0');
	

      }

      
    }   if (!buttonPressed(PIND,PD7)) {

      if (bPressed == 1){
	PORTB &= ~(_BV(0));
	bPressed = 0;

      }


    }

  }

  
  return 0;
}

