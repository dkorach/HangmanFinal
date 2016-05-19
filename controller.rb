require 'sinatra'
require_relative 'models/hangman.rb'
enable :sessions

get '/user_guess' do
	@game = Hangman.new
	session[:game] = @game

	erb :index
end

post '/user_guess' do
	user_guess = params[:user_guess]
	session[:game].play(user_guess)


end
