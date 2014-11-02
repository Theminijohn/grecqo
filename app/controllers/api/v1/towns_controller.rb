class Api::V1::TownsController < ApiController

  def show
    @town = Town.find(params[:id])
    respond_to do |f|
      f.json { render json: @town.to_json }
    end
  end

end
