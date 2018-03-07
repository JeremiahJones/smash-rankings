class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :gamer_tag
      t.string :country
      t.string :first_name
      t.string :last_name
      t.string :characters, array: true, default: []
      t.string :youtube
      t.string :twitter
      t.string :twitch
      t.timestamps
    end
  end
end
