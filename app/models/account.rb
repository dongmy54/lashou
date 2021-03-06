# == Schema Information
#
# Table name: accounts
#
#  id              :bigint(8)        not null, primary key
#  avatar          :string
#  is_main         :boolean          default(FALSE)
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#
# Indexes
#
#  index_accounts_on_company_id  (company_id)
#

# 企业 后台账户
class Account < ApplicationRecord
  belongs_to :company

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :name
  validates_presence_of   :name
  validates_length_of     :password, minimum: 6

end
