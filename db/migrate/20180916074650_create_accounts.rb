class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer  :company_id, index: true
      t.string   :name
      t.string   :avatar
      t.string   :password_digest
      # 是否 为主账号
      t.boolean  :is_main, default: false

      t.timestamps
    end
  end
end
