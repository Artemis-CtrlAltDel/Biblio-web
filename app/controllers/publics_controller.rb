class PublicsController < ApplicationController
  def index
    @adherent = current_adherent
  end

  def new
    @adherent = Adherent.new
  end

  def show
  end
  
end
