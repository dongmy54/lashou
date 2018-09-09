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

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
