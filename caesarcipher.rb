class String
	def numerical?
	Integer(self) != nil rescue false
	end
end

puts "Please enter phrase to be shifted."
phrase = gets.chomp
factor = ""
while !factor.numerical? do
	puts "Shift factor? (As integer)"
	factor = gets.chomp
end
factor = factor.to_i

phrase = phrase.split("").map do |letter|
		letter = letter.ord
		if letter >= 97 && letter <= 122
			lowercase = true 
		elsif letter >=65 && letter <=90 
			capital = true 
		else 
			lowercase = false
			capital = false
		end
		unless letter == 32 then letter += factor end
		if letter > 122 && lowercase == true then letter -= 26 end
		if letter < 97 && letter > 90
			if lowercase == true then letter += 26 elsif capital == true then letter -= 26 end
		end
		if letter <65 && capital == true then letter += 26 end
		if letter == 58 then letter = 32 end
		letter = letter.chr
end.join
puts phrase