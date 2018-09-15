# == Schema Information
#
# Table name: companies
#
#  id              :bigint(8)        not null, primary key
#  city            :string
#  desc            :string
#  logo            :string
#  name            :string
#  password_digest :string
#  scale           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  industry_id     :integer
#
# Indexes
#
#  index_companies_on_industry_id  (industry_id)
#

# 公司
class Company < ApplicationRecord
  belongs_to :industry

  has_secure_password

  # 规模
  Scale = %w(1-50人 50-100人 100-500人 500人以上).freeze

  validates_uniqueness_of  :name
  validates_presence_of    :name, :scale, :city
  validates_length_of      :name, :scale, :city, in: 1..30
  validates_length_of      :desc, in: 1..400, allow_blank: true

  validates :password, length: {in: 6..10}, on: :create
  validates :scale, inclusion: {in: Scale}

end
