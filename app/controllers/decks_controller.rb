class DecksController < ApplicationController
  def index
    @decks = Deck.all
    puts "Index decks called"
    render json: @decks
  end
end
