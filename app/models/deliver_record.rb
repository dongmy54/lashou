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

# 简历投递记录
class DeliverRecord < ApplicationRecord
  belongs_to :job
  belongs_to :resume

  # 投递状态
  State = %w(未读  已读  已联系  已入职  未通过).freeze

  validates_presence_of :state
  validates_inclusion_of :state, in: State

  # 给一个默认
  before_validation  do
    self.state = State.first if state.nil?
  end

end
