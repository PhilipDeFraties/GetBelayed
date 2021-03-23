require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        before :each do
          @user_params = {
            first_name: "Phil",
            last_name: "DeFraties",
            email: "fake@email.com"
          }

          @query_string = <<~GQL
            mutation {
              createUser(input: {
                firstName: "#{@user_params[:first_name]}",
                lastName: "#{@user_params[:last_name]}",
                email: "#{@user_params[:email]}"
                }) {
                  user {
                    id
                    firstName
                    lastName
                    email
                  }
                  errors
                }
              }
            GQL
        end

        it 'creates a user' do
          post '/graphql', params: { query: @query_string }
          expect(response.status).to eq(200)
          expect(User.count).to eq(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: @query_string }
          json = JSON.parse(response.body, symbolize_names: true)
          expect(json).to be_a(Hash)
          expect(json).to have_key(:data)
          expect(json[:data]).to be_a(Hash)
          expect(json[:data]).to have_key(:createUser)
          expect(json[:data][:createUser]).to be_a(Hash)
          expect(json[:data][:createUser]).to have_key(:user)
          expect(json[:data][:createUser][:user]).to be_a(Hash)

          expect(json[:data][:createUser][:user]).to be_a(Hash)
          expect(json[:data][:createUser][:user]).to have_key(:id)
          expect(json[:data][:createUser][:user][:id]).to be_a(String)
          expect(json[:data][:createUser][:user]).to have_key(:firstName)
          expect(json[:data][:createUser][:user][:firstName]).to be_a(String)
          expect(json[:data][:createUser][:user][:firstName]).to eq(@user_params[:first_name])
          expect(json[:data][:createUser][:user]).to have_key(:lastName)
          expect(json[:data][:createUser][:user][:lastName]).to be_a(String)
          expect(json[:data][:createUser][:user][:lastName]).to eq(@user_params[:last_name])
          expect(json[:data][:createUser][:user]).to have_key(:email)
          expect(json[:data][:createUser][:user][:email]).to be_a(String)
          expect(json[:data][:createUser][:user][:email]).to eq(@user_params[:email])
        end
      end
    end
  end
end
