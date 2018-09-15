# == Schema Information
#
# Table name: industries
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 行业
class Industry < ApplicationRecord
end
