# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute("TRUNCATE TABLE pokemons RESTART IDENTITY")

(1..151).each do |n|
  poke_data = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{n}")

  Pokemon.create! do |p|
    p.name = poke_data['name']
    p.pk_type = poke_data['types'].map{|t| t['type']['name'] }
    p.sprite = poke_data['sprites']['front_shiny']
    p.order = poke_data['order']
    p.height = poke_data['height']
    p.weight = poke_data['weight']
  end
end
