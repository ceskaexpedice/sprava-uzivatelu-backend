# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  include DeviseTokenAuth::Concerns::User

  has_many :favourites, dependent: :destroy
  has_many :last_page_indices, dependent: :destroy

  def has_role?(role)
    !self.roles.nil? && self.roles.split(",").include?(role)
  end

  def is_admin?
    has_role?("admin")
  end

end
