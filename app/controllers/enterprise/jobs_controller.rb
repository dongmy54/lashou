class Enterprise::JobsController < EnterprisesController
  before_action :require_account_login
  before_action :valid_job_is_current_company, only: [:show, :edit, :update]

  def index
  end

  def show
    @page_title = '职位详情'
  end

  def new
    @page_title = '添加职位'
    @job        = Job.new
  end

  def create
    @job            = Job.new(job_params)
    @job.company_id = current_company.id
    
    if @job.save
      flash[:notice] = '职位创建成功'
      redirect_to enterprise_job_path(@job) 
    else
      flash.now[:warning] = @job.errors.messages
      @page_title = '添加职位' 
      render :new
    end
  end

  def edit
    @page_title = '编辑职位'
  end

  def update
    if @job.update(job_params)
      flash[:notice] = '职位编辑成功'
      redirect_to enterprise_job_path(@job)
    else
      flash.now[:warning] = @job.errors.messages
      @page_title = '编辑职位' 
      render :new
    end
  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:education, :end_salary, :job_desc , :name, :start_salary,
                                  :worker_experience, :worker_type)
    end

    # 验证工作是否属于 当前公司
    def valid_job_is_current_company
      @job = Job.find_by_id(params[:id])
      
      # 工作不存在 同理
      unless @job && @job.company_id == current_company.id
        flash[:warning] = '职位不存在或该职位不属于本公司'
        redirect_to enterprise_root_path
      end
    end

end
