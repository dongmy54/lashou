class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.integer :industry_id, index: true
      # 公司名称
      t.string :name
      # 公司规模
      t.string :scale
      # 公司描述
      t.string :desc
      # 公司所在城市
      t.string :city
      # 公司审核阶段 密码
      t.string :password_digest
      # 公司logo
      t.string :logo

      t.timestamps
    end
  end
end
