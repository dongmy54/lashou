# == Schema Information
#
# Table name: jobs
#
#  id                :bigint(8)        not null, primary key
#  education         :string
#  end_salary        :decimal(4, 1)
#  job_desc          :text
#  name              :string
#  start_salary      :decimal(4, 1)
#  worker_experience :string
#  worker_type       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#

class Job < ApplicationRecord
  belongs_to :company
  has_many   :deliver_records
  # 收到简历
  has_many   :receive_resumes, through: :deliver_records, source: :resume

  # 类型
  WorkerType       = %w(全职 兼职).freeze
  # 学历
  Education        = %w(小学 初中 高中 专科 本科 硕士以上).freeze
  # 经验
  WorkerExperience = %w(无要求 1-3年 3-5年 5年以上).freeze

  validates_presence_of :name, :education, :worker_type, :education, :worker_experience,
                        :start_salary, :end_salary, :job_desc

  validates_length_of :name,     in: 1..30
  validates_length_of :job_desc, in: 1..1200

  validates :start_salary, :end_salary, numericality: {greater_than: 0, less_than: 9999}

  validates_inclusion_of :worker_type,       in: WorkerType
  validates_inclusion_of :education,         in: Education
  validates_inclusion_of :worker_experience, in: WorkerExperience


  # search_name 检索名（城市/职位名)
  # current_page 当前页
  def self.search(search_name, current_page=1)
    current_page = current_page_cal(current_page)
    offset_num   = (current_page - 1) * 10 # 每页 10

    # 行业
    if is_industry?(search_name)
      industry = Industry.find_by_name(search_name)
      count    = industry.jobs.count

      jobs     = industry.jobs.includes(company: :industry).offset(offset_num).limit(10) if count > 0
    elsif is_city?(search_name) && company_ids(search_name).present? # 城市
      c_ids = company_ids(search_name)
      count = Job.where(company_id: c_ids).count

      jobs  = Job.includes(company: :industry).where(company_id: c_ids).offset(offset_num).limit(10) if count > 0
    else
      count = Job.where('name like ?', "%#{search_name}%").count
      jobs  = Job.includes(company: :industry).where('name like ?', "%#{search_name}%").limit(10) if count > 0
    end

    jobs ||=  Job.none  # 空关系
    total_page = (count / 10) + (count % 10 == 0 ? 0 : 1)
    [jobs, current_page, total_page]
  end

  # 偏移量
  def self.current_page_cal(current_page)
    current_page = current_page.to_i <= 1 ? 1 : current_page.to_i
  end

  # 城市？
  def self.is_city?(city)
    SeedCity.include?(city)
  end

  # 行业？
  def self.is_industry?(industry)
    Industry::Type.include?(industry)
  end

  # 城市-公司id数组
  def self.company_ids(city)
    Company.where(:city => city).ids
  end



end
