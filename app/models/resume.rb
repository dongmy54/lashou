# == Schema Information
#
# Table name: resumes
#
#  id                 :bigint(8)        not null, primary key
#  apply_reason       :string
#  brief_intro        :string
#  career_experience  :string
#  life_creed         :string
#  project_experience :string
#  special_skill      :string
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  applicant_id       :integer
#

# 简历
class Resume < ApplicationRecord
  belongs_to :applicant
  has_many   :deliver_records
  # 投递职位
  has_many   :deliver_jobs, through: :deliver_records, source: :job

  validates_presence_of :apply_reason, :brief_intro, :career_experience, :life_creed, 
                        :project_experience, :special_skill, :title, :applicant_id

  # 为了便于显示 不要太长
  validates_presence_of :brief_intro, in: 1..32

  validates_length_of   :apply_reason, :career_experience, :life_creed, 
                        :project_experience, :special_skill, :title, in: 1..400


end
