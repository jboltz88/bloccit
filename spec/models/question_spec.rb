require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:question) {Question.create!(title: "New Question Title", body: "New Body Title", resolved: false)}
  describe "attributes" do
    it "has title, body and resolved attributes"
      expect(question).to have_attributes(title: "New Question Title", body: "New Body Title", resolved: false)
    end
  end  
end
