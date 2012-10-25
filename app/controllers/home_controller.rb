class HomeController < ApplicationController
  
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
