print "Enter a string to be encrypted: "
message = gets.chomp
msg_array = message.split(//)


# This is Encryption

encrypt = []

msg_array.each do |string|
	encrypt.push((string.ord + 5).chr)
end

print "\nEncrypted String: "

puts encrypt.join.inspect

# This is Decryption
print "\nDo you want to decrypt? (Y/N): "
option = gets.chomp

if ((option == 'Y') || (option == 'y'))
	
	decrypt = []

	encrypt.each do |string|
		decrypt.push((string.ord - 5).chr)
	end

	print "\nDecrypted String: "
	puts decrypt.join.inspect
else 
	puts "Bye!"
end
	

