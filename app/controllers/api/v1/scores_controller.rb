# frozen_string_literal: true

class Api::V1::ScoresController < ApiController
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  # POST /scores
  def create
    @score = Score.new(score_params)

    if @score.save
      render json: { status: :created }
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      render json: { status: :updated }
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy
  end

  private
  def set_score
    @score = Score.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def score_params
    params.require(:score).permit(:user_id, :started_playing, :score_value, :time_spent)
  end
end
