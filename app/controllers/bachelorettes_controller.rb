class BachelorettesController < ApplicationController
  def show
    @bachelorette = Bachelorette.find(params[:id])
    @contestants = @bachelorette.contestants
  end
end
