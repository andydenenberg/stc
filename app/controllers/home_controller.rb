class HomeController < ApplicationController

  def groundbreaking    
  end
  
  def start    
  end
  
  def index
    @users = User.all
  end
end
