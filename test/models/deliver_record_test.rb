# == Schema Information
#
# Table name: deliver_records
#
#  id         :bigint(8)        not null, primary key
#  comment    :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#  resume_id  :integer
#

require 'test_helper'

class DeliverRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
