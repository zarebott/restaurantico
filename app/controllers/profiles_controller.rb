class ProfilesController < ApplicationController
before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
  end

  def new
    @profile = Profile.new
  end

end
