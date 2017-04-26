class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:search]
    @pokemons = Pokemon.where('name ILIKE ?', "%#{params[:search]}%")

    fresh_when @pokemons
    end
    @pokemons
  end

  def pokesearch
    @pokemons = Pokemon.all
    if params[:search]
      @pokemons = Pokemon.where('name ILIKE ?', "%#{params[:search]}%")
    end
    if stale?(@pokemons)
    render json: @pokemons
    end
  end
  @pokemons
end
