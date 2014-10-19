class PromisesController < ApplicationController
  def show
    @promise = Promise.find(params[:id]).increment!(:visualization_count)
  end
end
