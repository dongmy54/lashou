class AddTitleToResumes < ActiveRecord::Migration[5.1]
  def change
    # 简历名称
    add_column :resumes, :title, :string
  end
end
