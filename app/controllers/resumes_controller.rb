class ResumesController < ApplicationController

  def index
    @applicant = Applicant.find(params[:applicant_id]) 
  end

  def new
  end

  def create
  end

  private
    def resume_params
      params.require(:resume).permit(:life_creed, :brief_intro, :career_experience, :apply_reason,
                                     :special_skill, :project_experience)
    end
end
