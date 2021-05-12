class UsersController < ApplicationController
  before_action :set_user_profile

  def profile
  end

  private
    def set_user_profile
      if User.exists?(params[:id])
        @user_profile = User.find(params[:id])
        @user_listings = Listing.where(user_id: @user_profile.id)
      else
        redirect_to root_path
      end
    end
end