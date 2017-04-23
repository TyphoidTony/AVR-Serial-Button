# Avr-Serial-Button
A very simple way to create a single keyboard press from A Atmeg8 microcontroller via serial communication. 


## Notes &  Limitations 
	
Currently a lot of things need to be done for the host. As of right now, a button press only toggles. 




### TODO

- ~~user defined hotkey (the letter A is currently hard coded as the button press)~~
- ~~Compile C sources for the lua libraries used (luars232 and uinput respectivly)~~*
- pressedByte and releasedByte to allow continous transmission 
- Some form of background process or deamon for the lua script to run on startup and in the background

	*Currently User input only accepts one key for input. That to make it more than 1 to have a series of key chords will come after. Currently the keys are limited to what uinput has availiable which should more than enough for most people. 

### Requirements

- lua 5.1 or later. 
- libncursesw-dev
- libncurses-dev
- libgirepository1.0-dev

### Libraries Used

- Luars232
- Uinput

