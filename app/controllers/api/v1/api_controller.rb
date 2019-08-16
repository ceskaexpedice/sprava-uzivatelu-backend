class Api::V1::ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private
    def require_logged_in
      if current_user.nil?
        render status: 401, json: { message: "Unauthorized" }
      end
    end

    def render_404
      render status: 404, json: { message: "Not Found" }
    end


end
