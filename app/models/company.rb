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

class Company < ApplicationRecord
end
