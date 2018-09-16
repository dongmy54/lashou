class ChangeJobDescTypeToText < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :job_desc, :text
  end
end
