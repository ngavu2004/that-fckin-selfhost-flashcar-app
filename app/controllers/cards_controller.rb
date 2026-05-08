class CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards
  end

  def create
    @cards = Card.create(name: params[:deck_name])
  end
end
