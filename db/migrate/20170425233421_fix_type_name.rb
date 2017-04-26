class FixTypeName < ActiveRecord::Migration
  def change
    rename_column :pokemons, :type, :pk_type

  end
end
