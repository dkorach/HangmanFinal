require 'sinatra'
require_relative 'models/hangman.rb'
enable :sessions

get '/' do
	session[:game] = Hangman.new
	@lives = session[:game].lives_left
	@word = session[:game].blanks
	

	erb :index
end

post '/user_guess' do
	user_guess = params[:user_guess]
	session[:game].play(user_guess)
	@lives = session[:game].lives_left
	if @lives > 0
		if session[:game].guessing_word.include? params[:user_guess]
  			@context = "OOOOOOHHHHHH YEEEEEAAAA"
		else
			@context = "NOOOOOOOOOOOO"
		end
		erb :index
	else
		@end = "You lose"
		erb :results
	end
end
