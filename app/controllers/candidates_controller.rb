class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
  end

  protected

  def valid_params(params)
    params.require(:candidate).permit(:id)
  end
end
