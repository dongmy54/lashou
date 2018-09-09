class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      # 人生信条
      t.string :life_creed
      # 简介
      t.string :brief_intro
      # 职场经历
      t.string :career_experience
      # 求职原因
      t.string :apply_reason
      # 特长
      t.string :special_skill
      # 项目经历
      t.string :project_experience
      t.integer :applicant_id

      t.timestamps
    end
  end
end
