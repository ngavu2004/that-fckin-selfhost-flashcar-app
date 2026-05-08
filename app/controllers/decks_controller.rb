class DecksController < ApplicationController
  before_action :find_deck , only: %i[ show edit update destroy]
  def index
    @decks = Deck.all
    puts "Decks index called"
    render json: {result: @decks.as_json , status: " ۜ(♥_♥)"}
  end

  def new
    puts "Decks new called"
  end

  def create
    @decks = Deck.create(name: params[:deck_name])

    render json: {result: @decks, status: "┏━┓ ︵ /(^.^/)"}
  end

  def show
    render json: {result: @deck, status: "ᕕ(⌐■_■)ᕗ ♪♬"}
  end

  def edit
    puts "Decks edit called"
  end

  def update
    render json: {result: @deck.update(deck_info), status: "(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧"}
  end

  def destroy
    if @deck
      render json: {result: @deck.destroy, status: "(╥﹏╥)"}
    else
      render json: {message: "This deck is no longer exists", status: "¯\\_(ツ)_/¯"}
    end
  end

  private

    def find_deck
      if Deck.exists?(params['id'])
        @deck = Deck.find(params['id'])
      else
        @deck = nil
      end
    end

    def deck_info
      params.expect(deck: [ :name ])
    end
end
