# == Schema Information
#
# Table name: collections
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :integer
#  job_id       :integer
#
# Indexes
#
#  index_collections_on_applicant_id_and_job_id  (applicant_id,job_id)
#

# 收藏
class Collection < ApplicationRecord
  belongs_to :applicant
  belongs_to :job

end
