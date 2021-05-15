# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Score, type: :model do
  context 'Validate required fields' do
    it 'required fields in new score' do
      user = FactoryBot.create(:user)
      user.save
      score = Score.new(
        started_playing: DateTime.current,
        score_value: 10,
        time_spent: '00:20:00',
        user_id: user.id
      )
      expect(score).to be_valid
    end

    it 'all fiels are requireds' do
      user = FactoryBot.create(:user)
      user.save
      score = Score.new(
        started_playing: nil,
        score_value: nil,
        time_spent: nil,
        user_id: nil
      )
      expect(score).not_to be_valid
    end

    it 'score value number should be a integer' do
      user = FactoryBot.create(:user)
      user.save
      score = Score.new(
        started_playing: DateTime.current,
        score_value: 'a10ssaw',
        time_spent: '00:20:00',
        user_id: user.id
      )
      score.valid?
      expect(score.errors.full_messages).to include('Score value is not a number')
    end
    it 'time_spent should be a time' do
      user = FactoryBot.create(:user)
      user.save
      score = Score.new(
        started_playing: DateTime.current,
        score_value: 1,
        time_spent: 10,
        user_id: user.id
      )
      score.valid?
      expect(score.errors.full_messages).to include("Time spent can't be blank")
    end
  end
end
