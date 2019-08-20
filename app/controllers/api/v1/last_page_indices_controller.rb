class Api::V1::LastPageIndicesController < Api::V1::ApiController
  before_action :require_logged_in

  def index
    lpi = current_user.last_page_indices.where("kramerius=? AND uuid=?", params[:kramerius], params[:uuid]).first
    index = lpi.nil? ? nil : lpi.index
    render json: { index:  index } 
  end

  def create
    lpi = current_user.last_page_indices.where("kramerius=? AND uuid=?", params[:kramerius], params[:uuid]).first
    if lpi.nil?
      current_user.last_page_indices.create(kramerius: params[:kramerius], uuid: params[:uuid], index: params[:index])
    else
      lpi.update(index: params[:index])
    end
  end

end
