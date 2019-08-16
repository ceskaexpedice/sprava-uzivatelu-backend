class Api::V1::FavouritesController < Api::V1::ApiController
  before_action :require_logged_in

  def index
    render json: current_user.favourites.select(:uuid, :kramerius, :title, :author, :date, :policy, :doctype).order(created_at: :desc)
  end

  def create
    favourite = current_user.favourites.new(favourite_params)
    if favourite.save
      render json: favourite, status: :created
    else
      render json: favourite.errors, status: :unprocessable_entity
    end
  end

  def revoke 
    current_user.favourites.where("kramerius=? AND uuid=?", params[:kramerius], params[:uuid]).destroy_all
    render json: { "success": true }
  end



  private 
  def favourite_params
    params.require(:favourite).permit(:uuid, :kramerius, :title, :author, :date, :policy, :doctype)
  end


end