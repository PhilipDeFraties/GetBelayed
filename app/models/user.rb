# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
end
