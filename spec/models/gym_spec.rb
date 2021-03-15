# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gym do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lon }
  end

  describe 'relationships' do
    it { should have_many :posts }
  end
end
