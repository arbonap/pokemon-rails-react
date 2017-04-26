require 'rails_helper'
RSpec.describe Pokemon, type: :model do
    let(:valid_pokemon) { Pokemon.new(name:'Charizard',
                                      pk_type: 'fire',
                                      sprite: 'another_image.jpg',
                                      order: '5',
                                      height: '80 inches',
                                      weight: '250 lbs') }

    let(:invalid_pokemon) { Pokemon.new(name: nil,
                                        pk_type: nil,
                                        sprite: nil,
                                        order: nil,
                                        height: nil,
                                        weight: nil) }

    it "is valid with valid attributes" do
      expect(valid_pokemon).to be_valid
    end

    it "is not valid with all nil attributes" do
      expect(invalid_pokemon).to_not be_valid
    end

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:pk_type) }

    it { should validate_presence_of(:sprite) }

    it { should validate_presence_of(:order) }

    it { should validate_presence_of(:height) }

    it { should validate_presence_of(:weight) }

    it { should validate_uniqueness_of(:name) }

    it { should validate_uniqueness_of(:sprite) }

    # describe '.search' do
    #   before do
    #    response = INDIEGOGO_RESPONSE
    #    stub_request(:get, INDIEGOGO_ENDPOINT).
    #        with(:headers => {'Accept'=>'*/*',
    #                         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #                         'Host'=>'api.indiegogo.com',
    #                         'User-Agent'=>'Ruby'}).
    #                         to_return(:status => 200, :body => response, :headers => {})
    #
    #   it 'returns a hash of campaigns and their attributes' do
    #     response = Campaign.search
    #
    #     expect(response).to be_an_instance_of(Hash)
    #     expect(response).to eq response
    #   end
    #
    #   context "responds to its methods" do
    #     it { expect(valid_pokemon).to respond_to(:search) }
    #   end
    # end
end
