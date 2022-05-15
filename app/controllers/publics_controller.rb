class PublicsController < ApplicationController
  def index    
    @adherent = current_adherent

    redirect_to @adherent if !@adherent.nil?
  end

  def new
    @adherent = Adherent.new
  end

  def show
  end
  
end
