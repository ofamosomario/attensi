class Score < ApplicationRecord

  # RELATIONSHIP - MODEL
  belongs_to :user

  # MODEL VALIDATES
  validates_presence_of :started_playing, :score, :time_spent, :user_id
  validates :started_playing, date: true
  validates_numericality_of :score

end
