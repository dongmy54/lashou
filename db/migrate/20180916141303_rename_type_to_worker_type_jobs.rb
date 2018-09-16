class RenameTypeToWorkerTypeJobs < ActiveRecord::Migration[5.1]
  def change
    rename_column :jobs, :type, :worker_type
  end
end
