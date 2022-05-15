class PublicsController < ApplicationController
  def index    
    @adherent = current_adherent
    @respo = current_respo

    redirect_to @adherent if !@adherent.nil?
    redirect_to @respo if !@respo.nil?
    
  end

  def new
    @adherent = Adherent.new
  end

  def show
  end
  
end
