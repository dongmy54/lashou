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

  # 类型
  WorkerType             = %w(全职 兼职).freeze
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
end
