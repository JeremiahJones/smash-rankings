class CreateMiomRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :miom_rankings do |t|
      t.belongs_to :player, index: true
      t.integer :year
      t.float :score
      t.string :change
      t.integer :rank

      t.timestamps
    end
  end
end
