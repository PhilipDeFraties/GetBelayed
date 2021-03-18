# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  it 'loads single user' do
    query_string = <<~GQL
      query {
        user(id: 4) {
          id
          firstName
          lastName
          email
          gender
        }
      }
    GQL

    user = FactoryBot.create(:user)
    post '/graphql', params: { query: query_string }
    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data]).to have_key(:user)
    expect(json[:data][:user]).to be_a(Hash)

    expect(json[:data][:user]).to be_a(Hash)
    expect(json[:data][:user]).to have_key(:id)
    expect(json[:data][:user][:id]).to be_a(String)
    expect(json[:data][:user][:id].to_i).to eq(user.id)
    expect(json[:data][:user]).to have_key(:firstName)
    expect(json[:data][:user][:firstName]).to be_a(String)
    expect(json[:data][:user][:firstName]).to eq(user.first_name)
    expect(json[:data][:user]).to have_key(:lastName)
    expect(json[:data][:user][:lastName]).to be_a(String)
    expect(json[:data][:user][:lastName]).to eq(user.last_name)
    expect(json[:data][:user]).to have_key(:email)
    expect(json[:data][:user][:email]).to be_a(String)
    expect(json[:data][:user][:email]).to eq(user.email)
    expect(json[:data][:user]).to have_key(:gender)
    expect(json[:data][:user][:gender]).to be_a(String)
    expect(json[:data][:user][:gender]).to eq(user.gender)
  end
end
