class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :random_number
      t.column :result, :integer
      t.integer :level, default: 4
      t.boolean :allow_repetitions, default: false
      t.timestamp :closed_at
      t.timestamps
    end
  end
end
