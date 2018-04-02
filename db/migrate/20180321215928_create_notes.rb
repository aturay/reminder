class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :text
      t.datetime :send_time
      t.datetime :next_time, index: true
      t.integer :interval_count, default: 1
      t.integer :interval_type, default: 0
      t.references :user

      t.timestamps
    end

    add_foreign_key :notes, :users, on_delete: :cascade
  end
end
