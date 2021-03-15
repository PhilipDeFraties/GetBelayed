# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :gym

  validates :type, presence: true
  validates :text, presence: true
end
