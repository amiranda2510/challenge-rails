class ProfilesController < ApplicationController

  def new
    @profile = Profile.new  
  end

  def create
    @profile = Profile.new profile_params
    if @profile.save
      flash[:notice] = 'Profile created succesfully'
      response = @profile
      status = :ok
    else
      flash[:error] = @profile.errors.full_messages
      response = { error_msg: @profile.errors.full_messages }
      status = :unprocessable_entity
    end

    respond_to do |format|
      format.html { redirect_to new_profile_path }
      format.json { render json: response, status: status  }
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:username)
    end
end
