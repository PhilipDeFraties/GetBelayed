require 'rails_helper'

RSpec.describe Post do
  describe 'Validations' do
    it {should validate_presence_of :type}
    it {should validate_presence_of :text}
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :gym}
  end
end
