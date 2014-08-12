class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :number
      t.integer :cows, default: 0
      t.integer :bulls, default: 0
      t.references :game
      t.timestamps
    end

    add_index :moves, :game_id
  end
end
