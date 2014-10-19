class TopPromisesController < ApplicationController
  def index
    @promises = Promise.top_promises.page(params[:page])
  end
end
