class PromisesController < ApplicationController
  def new
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.build
  end

  def create
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.build(promise_params)
    @promise.visible = false
    
    if @promise.save
      redirect_to @candidate
    else
      render 'new'
    end
  end

  def show

  end

  private
    def promise_params
      params.require(:promise).permit(:title, :description, :category_id, :date, :status)
    end
end
