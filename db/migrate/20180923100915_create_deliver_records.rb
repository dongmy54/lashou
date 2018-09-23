class CreateDeliverRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :deliver_records do |t|
      t.integer :job_id, add_index: true
      t.integer :resume_id, add_index: true
      # 状态 未读 / 已读 / 已联系 / 已入职 / 未通过
      t.string  :state
      # 原因/评语
      t.string  :comment

      t.timestamps
    end
  end
end
