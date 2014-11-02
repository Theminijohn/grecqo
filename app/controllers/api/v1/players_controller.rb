class Api::V1::PlayersController < ApiController

  def show
    @player = Player.find(params[:id])
    respond_to do |f|
      f.json { render json: @player.to_json }
    end
  end

end
