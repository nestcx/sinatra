require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

@@guesses_left = 5

def check_guess(guess)
	if guess.to_i > NUMBER
		if guess.to_i - 5 > NUMBER
			return "way too high!"
		else
			return "too high!"
		end
	elsif guess.to_i < NUMBER
		if guess.to_i + 5 < NUMBER
			return "way too low!"
		else
			return "too low!"
		end
	else
		return "correct"
	end
end

get '/' do
	guess = params["guess"]
	cheat = params["cheat"]

	@@guesses_left = @@guesses_left - 1

	if @@guesses_left == 0
		NUMBER = rand(100)
		@@guesses_left = 5
	end

	response = check_guess(guess)

	if response == "correct"
		message = NUMBER
		color = "green"
		NUMBER == rand(100)
		@@guesses_left = 5
	elsif response != "correct"
		message = "?"
	end

	message = NUMBER if cheat.to_s == "true"
	
	color = "tomato" if response == "way too high!"
	color = "coral" if response == "too high!"
	color = "gray" if response == "way too low!"
	color = "silver" if response == "too low!"
	erb :index, :locals => {:guesses_left => @@guesses_left, :color => color, :message => message, :response => response}
end


