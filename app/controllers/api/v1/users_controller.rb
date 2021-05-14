class Api::V1::UsersController < ApplicationController

  def top_users
    
    if params.has_key?(:week_number)

      period = ScoreService.week_number params[:week_number].to_i

      @scores = ScoreService.get_score_by_period period
      
      if @scores.present?
        render json: @scores
      else
        render json: { status: :no_content }
      end

    end
    
  end

  def topper_and_lower_users

    @scores = ScoreService.get_score

    if @scores.present?
      render json: @scores
    else
      render json: { status: :no_content }
    end   

  end

end