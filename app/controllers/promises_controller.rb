class PromisesController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

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
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.find(params[:id])
    @promise.increment!(:visualization_count)
  end

  def vote_up
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.find(params[:id])

    if session.has_key?(@promise.id)
      redirect_to candidate_promise_path(@candidate, @promise), :alert => I18n.t('promises.already_voted')
    else
      @promise.increment!(:up_votes)
      register_vote_in_session

      redirect_to candidate_promise_path(@candidate, @promise), :notice => I18n.t('promises.vote_registered')
    end
  end

  def vote_down
    @candidate = Candidate.find params[:candidate_id]

    @promise = @candidate.promises.find(params[:id])

    if session.has_key?(@promise.id)
      redirect_to candidate_promise_path(@candidate, @promise), :alert => I18n.t('promises.already_voted')
    else
      @promise.increment!(:down_votes)
      register_vote_in_session

      redirect_to candidate_promise_path(@candidate, @promise), :notice => I18n.t('promises.vote_registered')
    end
  end

  private
    def promise_params
      params.require(:promise).permit(:title, :description, :category_id, :date, :status)
    end

    def register_vote_in_session
      session[@promise.id] = true
    end
end
