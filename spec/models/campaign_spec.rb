require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:valid_campaign) { Campaign.new(title:'Space Jam',
                                      small_image_url: 'hello.jpg',
                                      large_image_url: 'another_image.jpg',
                                      tagline: 'Give me funding, please!',
                                      web_url: 'www.patriciaarbona.com') }

  let(:invalid_campaign) { Campaign.new(title: nil,
                                        small_image_url: nil,
                                        large_image_url: nil,
                                        tagline: nil,
                                        web_url: nil) }

  it "is valid with valid attributes" do
    expect(valid_campaign).to be_valid
  end

  it "is not valid with all nil attributes" do
    expect(invalid_campaign).to_not be_valid
  end

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:small_image_url) }

  it { should validate_presence_of(:large_image_url) }

  it { should validate_presence_of(:tagline) }

  it { should validate_presence_of(:web_url) }

  it { should validate_uniqueness_of(:title) }

  it { should validate_uniqueness_of(:web_url) }

  describe '.search' do
    before do
     response = INDIEGOGO_RESPONSE
     stub_request(:get, INDIEGOGO_ENDPOINT).
         with(:headers => {'Accept'=>'*/*',
                          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                          'Host'=>'api.indiegogo.com',
                          'User-Agent'=>'Ruby'}).
                          to_return(:status => 200, :body => response, :headers => {})

    it 'returns a hash of campaigns and their attributes' do
      response = Campaign.search

      expect(response).to be_an_instance_of(Hash)
      expect(response).to eq response
    end
    
    context "responds to its methods" do
      it { expect(valid_campaign).to respond_to(:search) }
    end
  end
end
end
