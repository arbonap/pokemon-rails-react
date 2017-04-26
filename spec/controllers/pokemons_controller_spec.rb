require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do

    describe "GET #index" do
      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end

      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
      it "assigns @pokemons" do
        get :index

        expect(assigns(:pokemons)).to_not be_nil
      end
    end


    describe "GET /pokesearch" do
      it "returns http success for an AJAX request" do
        xhr :get, :pokesearch
        expect(response).to be_ok
      end
    end



end
