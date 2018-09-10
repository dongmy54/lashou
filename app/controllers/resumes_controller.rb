class ResumesController < ApplicationController

  def index
    # 提前加载 简历
    @applicant = Applicant.includes(:resumes).find(params[:applicant_id]) 
  end

  def show
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = Resume.find(params[:id]) 
  end

  def new
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = Resume.new
  end

  def create
    @applicant           = Applicant.find(params[:applicant_id])
    @resume              = Resume.new(resume_params)
    @resume.applicant_id = @applicant.id

    if @resume.save
      flash[:notive] = t("common.success_create", '简历')
      redirect_to applicant_resumes_path(@applicant)
    else
      flash[:warning] = @resume.errors.messages
      render :new
    end
  end

  private
    def resume_params
      params.require(:resume).permit(:life_creed, :brief_intro, :career_experience, :apply_reason,
                                     :special_skill, :project_experience, :title)
    end
end
