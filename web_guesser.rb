require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

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
	response = check_guess(guess)
	if response == "correct"
		message = NUMBER
	else
		message = "?"
	end
		erb :index, :locals => {:message => message, :response => response}
end









