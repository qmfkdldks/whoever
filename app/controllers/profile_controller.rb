class ProfileController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @articles = current_user.articles
    @comments = current_user.comments
  end

end
