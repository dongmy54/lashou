class ResumesController < ApplicationController
  before_action :require_login
  before_action :only_can_show_self

  def index
    # 提前加载 简历
    @applicant = Applicant.includes(:resumes).find(params[:applicant_id]) 
  end

  def show
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = Resume.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { send_resume_pdf(@applicant, @resume)}
    end
  end

  def new
    if params[:type] == 'resume_not_exist'
      flash[:warning] = '还没简历,没关系，现在写一份'
    end
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = Resume.new
  end

  def edit
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = @applicant.resumes.find_by_id(params[:id]) 
    
    # 简历不属于 该求职者
    redirect_to root_path unless @resume
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

  def update
    @applicant = Applicant.find(params[:applicant_id])
    @resume    = @applicant.resumes.find_by_id(params[:id]) 
    
    # 简历不属于 该求职者
    redirect_to root_path and return unless @resume

    if @resume.update(resume_params)
      flash[:notice] = '简历已更新成功'
      redirect_to applicant_resumes_path(@applicant)
    else
      flash[:warning] = @resume.errors.messages
      render :edit
    end
  end


  private
    def resume_params
      params.require(:resume).permit(:life_creed, :brief_intro, :career_experience, :apply_reason,
                                     :special_skill, :project_experience, :title)
    end

    def send_resume_pdf(applicant,resume)
      resume_pdf = ResumePdf.new(applicant, resume)

      send_file resume_pdf.to_pdf,
        filename:    resume_pdf.filename,
        type:        "application/pdf",
        disposition: "inline"
    end

    def only_can_show_self
      @applicant = Applicant.find(params[:applicant_id])
      redirect_to root_path unless @applicant == current_applicant
    end

end
