class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.text :entry
      t.references :user

      t.timestamps
    end
    add_index :user_histories, :user_id
  end
end
