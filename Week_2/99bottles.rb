bottles_left = 99
bottles_next = 98

until (bottles_left == 0)
	print "#{bottles_left} bottles of beer on the wall, #{bottles_left} bottles of beer.\nTake one down and pass it around, #{bottles_next} bottles of beer on the wall.\n\n"

	bottles_left -= 1
    bottles_next -= 1
end	  