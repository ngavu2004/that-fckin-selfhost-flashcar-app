class CardsController < ApplicationController
  before_action :find_deck, only: %i[ index create ]
  def index
    @cards = Card.all
    render json: @cards
  end

  def create
    if @deck
      @card = Card.new(card_info)
      @card.deck = @deck
      if @card.save
        render json: {result: @card.as_json, status: "(/◕ヮ◕)/ (^o^) (✿◠‿◠)"}
      else
        card_create_failed
      end
    else
      not_found(:deck)
    end
  end

  def show
    @card = Card.exists?(params[:id])
    if @card
      render json: {result: Card.find(params[:id]).as_json, status: "(/◕ヮ◕)/ (^o^) (✿◠‿◠)"}
    else
      not_found(:card)
    end
  end

  def update
    if Card.exists?(params[:id])
      @card = Card.find(params[:id])
      render json: {result: @card.update(card_info).as_json, status: "(/◕ヮ◕)/ (^o^) (✿◠‿◠)"}
    else
      not_found(:card)
    end
  end

  def destroy
    if Card.exists?(params[:id])
      @card = Card.find(params[:id])
      render json: {result: @card.destroy.as_json, status: "[¬º-°]¬"}
    else
      not_found(:card)
    end
  end

  private
    def card_info
      params.expect(card: [ :front, :back, :confidence ])
    end

    def card_create_failed
      render json: {message: "This card failed to be created. Please try again", status: "( -_-)旦~"}
    end

    def not_found(object)
      render json: {message: "This #{object} is no longer exists", status: "¯\\_(ツ)_/¯"}
    end

    def find_deck
      if Deck.exists?(params['deck_id'])
        @deck = Deck.find(params['deck_id'])
      else
        @deck = nil
      end
    end
end
