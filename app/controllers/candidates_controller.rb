class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.search(params[:search], params[:page])
  end

  def show
    @candidate = Candidate.find(params[:id])
    @most_voted = @candidate.promises.visible
                    .order('up_votes - down_votes DESC').limit(5)
    @most_visualized = @candidate.promises.visible
                    .order(visualization_count: :desc).limit(5)

    @promises = @candidate.promises.visible
                    .order(created_at: :desc)
  end

  protected

  def valid_params(params)
    params.require(:candidate).permit(:id)
  end
end
