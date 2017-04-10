require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:valid_campaign) { Campaign.new(title:'Space Jam', small_image_url: 'https://www.hello.jpg', large_image_url: 'https://www.another_image.jpg', tagline: 'Give me funding, please!', web_url: 'https://www.patriciaarbona.com') }
  let(:invalid_campaign) { Campaign.new(title: nil, small_image_url: nil, large_image_url: nil, tagline: nil, web_url: nil) }

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
    it 'should return ' do

    end
  end

end
