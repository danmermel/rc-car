require 'wiringpi'
require 'io/console'

io = WiringPi::GPIO.new

# 0 = right fwd
# 3 = right back
# 4 = left fwd
# 1 = left back

puts "turning on"
io.mode(0,OUTPUT)
io.mode(1,OUTPUT)
io.mode(3,OUTPUT)
io.mode(4,OUTPUT)

def stop_all(var)  #stops everything before next manouvre
   var.write(0,LOW)
   var.write(1,LOW)
   var.write(3,LOW)
   var.write(4,LOW)
end

while true
   input = STDIN.getch
   if input == 'w' then  #forward
      stop_all(io)
      io.write(0,HIGH)
      io.write(4,HIGH)
   end
   if input == 'x' then  # back
      stop_all(io)
      io.write(3,HIGH)
      io.write(1,HIGH)
   end
   if input == 'a' then #left
      stop_all(io)
      io.write(0,HIGH)
   end           
   if input == 'd' then #right
      stop_all(io)
      io.write(4,HIGH)
   end  

   stop_all(io) if input == 's'
   break if input == 'q'
end

puts "goodbye"
