class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer  :company_id, index: true
      # 职位名称
      t.string   :name
      # 职位类型 全职/兼职
      t.string    :type
      # 起薪 单位k
      t.decimal  :start_salary, precision: 4, scale: 1
      # 最大薪酬 单位k
      t.decimal  :end_salary, precision: 4, scale: 1
      # 学历要求
      t.string   :education
      # 工作经验
      t.string   :worker_experience
      # 工作描述
      t.string   :job_desc
      
      t.timestamps
    end
  end
end
