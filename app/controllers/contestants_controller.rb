class ContestantsController < ApplicationController
  before_action :get_bachelorette, only: [:index, :show]
  def index
    @contestants = @bachelorette.contestants
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  private
  def get_bachelorette
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end
end
