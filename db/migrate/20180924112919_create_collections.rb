class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.integer :applicant_id
      t.integer :job_id

      t.timestamps
    end
    
    add_index :collections, [:applicant_id, :job_id]
  end
end
