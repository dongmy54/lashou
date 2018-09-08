class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :avatar
      t.string :name
      t.integer :age
      t.string :sex
      t.string :mobile
      t.string :email
      # 学历
      t.string :education
      t.string :school
      t.string :city
      t.string :address
      t.string :blog_address

      t.timestamps
    end
  end
end
