class ApplicantsController < ApplicationController
  before_action :require_login, only: [:show, :update, :my_deliver]

  # 个人主页
  def show
    @applicant = Applicant.find(params[:id])
  end

  def new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      flash[:notice] = '恭喜您注册成功'
      applicant_login
      redirect_to applicant_path(@applicant)
    else
      flash.now[:warning] = @applicant.errors.messages
      render 'new'
    end
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      flash[:notice] = t("common.success_update", name: '个人')
      redirect_to applicant_path(@applicant)
    else
      flash.now[:warning] = @applicant.errors.messages
      render :show
    end
  end

  # 添加收藏
  def add_collection
    result = {success: true}

    # 登录
    unless applicant_is_login?
      result[:success]    = false
      result[:err_reason] = 'not_login'
      result[:err_desc]   = '亲,你还没登录呢!'
    end

    # 收藏
    if result[:success] && has_collection?(params[:job_id])
      result[:success]    = false
      result[:err_reason] = 'has_collection'
      result[:err_desc]   = '亲,该职位你已添加过收藏'
    end

    if result[:success]
      collection = Collection.new(applicant_id: current_applicant.id, 
                                  job_id: params[:job_id])
      
      unless collection.save
        result[:success]    = false
        result[:err_reason] = 'other'
        result[:err_desc]   = collection.errors.messages 
      end
    end

    render json: result
  end

  # 取消收藏
  def cancel_collection
    result = {success: true}

    # 登录
    unless applicant_is_login?
      result[:success]    = false
      result[:err_reason] = 'not_login'
      result[:err_desc]   = '亲,你还没登录呢!'
    end

    # 收藏
    collection = current_applicant.collections.find_by_job_id(params[:job_id])
    if result[:success] && collection.nil?
      result[:success]    = false
      result[:err_reason] = 'collection_not_exist'
      result[:err_desc]   = '该笔收藏不存在'
    end

    if result[:success]
      unless collection.destroy
        result[:success]    = false
        result[:err_reason] = 'other'
        result[:err_desc]   = collection.errors.messages 
      end
    end

    respond_to do |format|
      format.html {redirect_to my_collection_path}
      format.json {render json: result}
    end
    
  end

  # 我的投递箱
  def my_deliver
    @datas, @current_page, @total_page = current_applicant.deliver_data(params[:current_page])
  end

  # 我的收藏
  def my_collection
    @datas, @current_page, @total_page = current_applicant.collection_data(params[:current_page])
  end

  private
    def applicant_params
      params.require(:applicant).permit(:address,:age,:avatar,:blog_address,
                                        :city, :education, :email, :mobile, :name,
                                        :password, :password_confirmation, :sex, :school)
    end

    def applicant_login
      session[:applicant_id] = @applicant.id
    end

end
