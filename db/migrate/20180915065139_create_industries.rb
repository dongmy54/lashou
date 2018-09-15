class CreateIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :industries do |t|
      # 行业名称
      t.string :name
      # 行业描述
      t.string :desc

      t.timestamps
    end
  end
end
