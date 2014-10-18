class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    @most_voted = @candidate.promises.where(visible: true)
                    .order('up_votes - down_votes DESC').limit(5)
  end

  protected

  def valid_params(params)
    params.require(:candidate).permit(:id)
  end
end
