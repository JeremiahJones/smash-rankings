class CreateMiomRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :miom_ranks do |t|
      t.belongs_to :player, index: true
      t.integer :year
      t.decimal :score
      t.string :change
      t.integer :rank

      t.timestamps
    end
  end
end
