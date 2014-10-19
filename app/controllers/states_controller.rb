class StatesController < ApplicationController
  def show
    @presidents = Candidate.where(:political_office => :president)

    @candidates = Candidate.per_state(params[:state]).page(params[:page])
  end
end
