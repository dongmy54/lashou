class AddStatusToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :status, :string, default: '待审核'
  end
end
