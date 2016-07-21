require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) {Advertisement.create!(title: "New Advertisement Title", body: "New Advertisement Body", price: 10) }
  describe "attributes" do
    it "has title, body and price atributes" do
      expect(advertisement).to have_attributes(title: "New Advertisement Title", body: "New Advertisement Body", price: 10)
    end
  end
end
