# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  def top_users
    return unless params.key?(:week_number)
    period = ScoreService.week_number params[:week_number].to_i
    @scores = ScoreService.score_by_period period
    if @scores.present?
      render json: @scores
    else
      render nil, status: :not_found
    end
  end

  def best_worst_rated_user
    @scores = ScoreService.best_worst_rated_user

    if @scores.present?
      render json: @scores
    else
      render nil, status: :not_found
    end
  end
end
