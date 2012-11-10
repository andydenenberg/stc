class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :welcome

  def reference
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
  end
  
  def donate
  end
  
  def news
  end
  
  def events
  end
  
  def welcome
  end

  def groundbreaking    
  end
  
  def start    
  end
  
  def index
    @users = User.all
  end
end
