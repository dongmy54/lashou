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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
