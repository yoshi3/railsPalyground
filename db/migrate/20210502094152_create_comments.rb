class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :person_id
      t.integer :message_id
      t.text :comment

      t.timestamps
    end
  end
end
