class PromisesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.build
  end

  def create
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.build(promise_params)
    @promise.visible = false

    if @promise.save
      redirect_to @candidate, :notice => I18n.t('promises.waiting_approval')
    else
      render 'new'
    end
  end

  def show
    @promise = Promise.find(params[:id]).increment(:visualization_count)
    begin
      @promise.save
    rescue Exception => e
      puts e.inspect
    end
  end

  private
    def promise_params
      params.require(:promise).permit(:title, :description, :category_id, :date, :status)
    end
end
