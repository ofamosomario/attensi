# frozen_string_literal: true

class Score < ApplicationRecord
  # RELATIONSHIP - MODEL
  belongs_to :user

  # KAMINARI
  paginates_per 10

  # MODEL VALIDATES
  validates_presence_of :started_playing, :score_value, :time_spent, :user_id
  validates :started_playing, date: true
  validates_numericality_of :score_value
end
