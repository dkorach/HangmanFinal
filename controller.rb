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
  			erb :index
  			@context = "OOOOOOHHHHHH YEEEEEAAAA"
		else
			erb :index
			@context = "NOOOOOOOOOOOO"
		end
		erb :index
	else
		erb :index
	end


end