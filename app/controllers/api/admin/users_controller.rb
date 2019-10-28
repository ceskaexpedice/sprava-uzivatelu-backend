class Api::Admin::UsersController < Api::Admin::AdminController

  def index
    result = []
    User.all.order(created_at: :desc).each do |user| 
      result.push({
        id: user.id,
        image: user.image,
        email: user.email,
        name: user.name,
        provider: user.provider,
        roles: user.roles,
        uid: user.uid,
        created_at: user.created_at,
        favourites_count: user.favourites.count
      })
    end
    render json: result
  end

  def add_role
    user = User.find(params[:id])
    role = params[:role]
    render_error "Missing role param" and return if role.blank?
    roles = user.roles.nil? ? [] : user.roles.split(",")
    roles.push role
    user.update(roles: roles.join(","))
    render status: 200, json: { roles: roles }
  end

  def remove_role
    user = User.find(params[:id])
    role = params[:role]
    render_error "Missing role param" and return if role.blank?
    roles = user.roles.nil? ? [] : user.roles.split(",")
    roles.delete role
    user.update(roles: roles.join(","))
    render status: 200, json: { roles: roles }
  end

end
