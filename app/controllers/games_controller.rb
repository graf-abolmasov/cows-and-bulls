class GamesController < ApplicationController

  respond_to :json
  respond_to :html, only: [:index]

  expose(:games)
  expose(:game, attributes: :game_params)

  def create
    game.save
    respond_with game, status: :created
  end

  private

  def game_params
    params.fetch(:game, {}).permit(:level)
  end
end
