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

  validates_presence_of :apply_reason, :brief_intro, :career_experience, :life_creed, 
                        :project_experience, :special_skill, :title, :applicant_id

  validates_length_of   :apply_reason, :brief_intro, :career_experience, :life_creed, 
                        :project_experience, :special_skill, :title, in: 1..120

end
