rs232 = require("luars232")
require("uinput")

port_name = "/dev/ttyUSB0"
local keyboard = uinput.create_keyboard()
local out = io.stderr

local e, p = rs232.open(port_name)

if e ~=rs232.RS232_ERR_NOERROR then
   out:write(string.format("can't open serial port '%s', error: '%s'\n",
			   port_name, rs232.error_tostring(e)))

else print(string.format("Connection to %s established",port_name))
   
end

assert(p:set_baud_rate(rs232.RS232_BAUD_9600) == rs232.RS232_ERR_NOERROR)
assert(p:set_data_bits(rs232.RS232_DATA_8) == rs232.RS232_ERR_NOERROR)
assert(p:set_parity(rs232.RS232_PARITY_NONE) == rs232.RS232_ERR_NOERROR)
assert(p:set_stop_bits(rs232.RS232_STOP_1) == rs232.RS232_ERR_NOERROR)
assert(p:set_flow_control(rs232.RS232_FLOW_OFF) == rs232.RS232_ERR_NOERROR)



io.write("Please Enter the key you would like to use. \n In the form of A for the letter A. \n If you would like to use a special character please spell out the character .e.g GRAVE for '`' \n :")

_input = io.read()

function keyNum()

   for key , value in pairs(require("uinput")) do
      if key:match("_".._input .."$") then  
	 local num = value
	 return num
      end

   end

end


while true do

   if p:read(1) == 0 then 

      keyboard:press(keyNum())
   
   else
      
      keyboard:release(keyNum())
   end

end






