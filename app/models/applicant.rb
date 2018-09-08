# == Schema Information
#
# Table name: applicants
#
#  id           :bigint(8)        not null, primary key
#  address      :string
#  age          :integer
#  avatar       :string
#  blog_address :string
#  city         :string
#  education    :string
#  email        :string
#  mobile       :string
#  name         :string
#  school       :string
#  sex          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# 求职者
class Applicant < ApplicationRecord
  validates :name, presence: true
end
