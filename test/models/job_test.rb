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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
