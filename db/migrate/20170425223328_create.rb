class Create < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
        t.string :name
        t.string :type
        t.string :sprite
        t.string :order
        t.string :weight
        t.string :height
    end
  end
end
