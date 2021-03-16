# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, type: :request do
  it 'loads all users' do
    query_string = <<~GQL
      query {
        users {
          id
          firstName
          lastName
          email
          gender
        }
      }
    GQL

    users = FactoryBot.create_list(:user, 3)

    post '/graphql', params: { query: query_string }

    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)

    json[:data][:users].each_with_index do |user_info, index|
      expect(user_info[:id].to_i).to eq(users[index].id)
      expect(user_info[:firstName]).to eq(users[index].first_name)
      expect(user_info[:lastName]).to eq(users[index].last_name)
      expect(user_info[:email]).to eq(users[index].email)
      expect(user_info[:gender]).to eq(users[index].gender)
    end
  end
end
