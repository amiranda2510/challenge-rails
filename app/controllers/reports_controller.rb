class ReportsController < ApplicationController

  def index
    @profiles = Profile.eager_load(:repositories)
    if params[:tag]
      @query = params[:tag]
      @profiles = @profiles.where('LOWER(repositories.tags) LIKE LOWER(?)', "%#{@query}%")
    end

    @profile_list = @profiles.map do |profile|
      { username: profile.username, repositories: profile.repositories.map { |repo| { id: repo.id, name: repo.name, tags: repo.tags, profile_id: repo.profile_id} } }
    end

    respond_to do |format|
      format.html
      format.json { render json: @profile_list.as_json }
    end
  end
end
