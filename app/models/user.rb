# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # RELATIONSHIP - MAP
  has_many :scores

  # ENUMS
  enum role: {
    admin: 0,
    student: 1
  }

  # MODEL VALIDATES
  validates :first_name, length: { minimum: 3, maximum: 50 }, allow_blank: false
  validates :last_name, length: { minimum: 3, maximum: 50 }, allow_blank: false
  validates :email, length: { minimum: 5, maximum: 70 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  # SCOPE
  scope :verify_user, -> { where(role: 'student') }

  # CUSTOM METHODS
  class << self
    include ScoreConstants
    def scores_by_period(first_day, last_day)
      select('users.id , users.first_name , users.last_name , sum(scores.score_value) as score_total,
        sum(scores.time_spent) as time_spent_total')
        .joins(:scores)
        .where(scores: { created_at: (first_day..last_day) })
        .order('score_total desc, time_spent_total desc')
        .group('users.id ')
    end

    def first_score_list
      select('users.id , users.first_name , users.last_name , sum(scores.score_value) as score_total,
        sum(scores.time_spent) as time_spent_total')
        .joins(:scores)
        .order('score_total desc, time_spent_total desc')
        .group('users.id ').limit(LIMIT_USER_BY_ONE)
    end

    def last_score_list
      select('users.id , users.first_name , users.last_name , sum(scores.score_value) as score_total,
        sum(scores.time_spent) as time_spent_total')
        .joins(:scores)
        .order('score_total asc, time_spent_total asc')
        .group('users.id ').limit(LIMIT_USER_BY_ONE)
    end
  end
end
