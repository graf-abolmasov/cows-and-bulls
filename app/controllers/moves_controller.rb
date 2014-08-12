class MovesController < ApplicationController

  respond_to :json

  def create
    @game = Game.find(params[:game_id])
    @move = @game.make_move!(params[:number])
    respond_with @move, status: :created
  end

end
