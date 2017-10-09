class CultureNewsReader::CLI

	def call
		puts "The Fader"
		puts "What category would you like to see?"
		categories = ["Music", "Style", "Culture"]
		categories.each_with_index do |category, i|
			puts "#{i+1}. #{category}"
		end
	end

end
