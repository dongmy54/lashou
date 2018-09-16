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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
