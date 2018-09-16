class Enterprise::JobsController < EnterprisesController
  before_action :require_account_login

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:education, :end_salary, :job_desc , :name, :start_salary,
                                  :worker_experience, :worker_type)
    end

end
