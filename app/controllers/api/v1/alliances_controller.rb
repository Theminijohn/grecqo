class Api::V1::AlliancesController < ApiController

  def show
    @alliance = Alliance.find(params[:id])
    respond_to do |f|
      f.json { render json: @alliance.to_json }
    end
  end

end
