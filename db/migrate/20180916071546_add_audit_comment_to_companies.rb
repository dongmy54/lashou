class AddAuditCommentToCompanies < ActiveRecord::Migration[5.1]
  def change
    # 审核 评语
    add_column :companies, :audit_comment, :string
  end
end
