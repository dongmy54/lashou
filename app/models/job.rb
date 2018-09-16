# == Schema Information
#
# Table name: jobs
#
#  id                :bigint(8)        not null, primary key
#  education         :string
#  end_salary        :decimal(4, 1)
#  job_desc          :string
#  name              :string
#  start_salary      :decimal(4, 1)
#  type              :string
#  worker_experience :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#
# 职位
class Job < ApplicationRecord
  belongs_to :company
  
end
