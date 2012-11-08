class CreateHardwareHistoryLogs < ActiveRecord::Migration
  def change
    create_table :hardware_history_logs do |t|
      t.text :entry
      t.references  :hardware_part

      t.timestamps
    end
    add_index :hardware_history_logs, :hardware_part_id
  end
end
