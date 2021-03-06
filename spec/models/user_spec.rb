# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should have_many :posts }
  end
end
