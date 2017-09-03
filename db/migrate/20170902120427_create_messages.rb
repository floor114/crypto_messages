class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :messages, id: :uuid do |t|
      t.text :body
      t.integer :destroy_type
      t.integer :visits_left
      t.datetime :destroy_date

      t.timestamps
    end
  end
end

