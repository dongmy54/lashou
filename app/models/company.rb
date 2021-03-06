# == Schema Information
#
# Table name: companies
#
#  id              :bigint(8)        not null, primary key
#  audit_comment   :string
#  city            :string
#  desc            :string
#  logo            :string
#  name            :string
#  password_digest :string
#  scale           :string
#  status          :string           default("待审核")
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
  has_many   :accounts, dependent: :destroy
  has_many   :jobs    , dependent: :destroy
  # 收到投递
  has_many   :receive_delivers, through: :jobs, source: :deliver_records
  belongs_to :industry

  
  mount_uploader :logo, LogoUploader

  has_secure_password

  # 规模
  Scale = %w(1-50人 50-100人 100-500人 500人以上).freeze
  # 状态
  Status = %w(待审核 审核通过 审核失败)

  validates_uniqueness_of  :name
  validates_presence_of    :name, :scale, :city
  validates_length_of      :name, :scale, :city, in: 1..30
  validates_length_of      :desc, in: 1..400, allow_blank: true

  validates :password, length: {in: 6..10}, on: :create
  validates :scale, inclusion: {in: Scale}
  validates :status, inclusion: {in: Status}

end
