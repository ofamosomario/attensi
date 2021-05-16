# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'
RSpec.describe Api::V1::ScoresController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  describe 'GET #scores' do
    subject { get :index, params: {} }
    context 'when user is authenticated' do
      it 'returns status code 200' do
        sign_in user
        expect(subject.status).to eq(200)
      end
    end
  end
  describe 'GET #create' do
    subject { get :index, params: {} }
    context 'when all fields required arent blank' do
      it 'returns status code 200' do
        sign_in user
        score = Score.new(
          started_playing: DateTime.current,
          score_value: 10,
          time_spent: '00:20:00',
          user_id: user.id
        )
        score.save
        expect(response.status).to eq(200)
        expect(subject.status).to eq(200)
      end
    end
  end
  describe 'PUT #update' do
    let!(:score) { Score.create!(started_playing: DateTime.current, score_value: 1, time_spent: '00:20:00', user_id: user.id) }
    subject { put :update, params: { id: score.id, score: { score_value: 5 } } }
    context 'when all fields required arent blank' do
      it 'returns status code 200' do
        sign_in user
        expect { subject }.to change { score.reload.score_value }.from(1).to(5)
        expect(response.status).to eq(200)
        expect(subject.status).to eq(200)
      end
    end
  end
  describe 'DELETE #destroy' do
    let!(:score) { Score.create!(started_playing: DateTime.current, score_value: 1, time_spent: '00:20:00', user_id: user.id) }
    subject { delete :destroy, params: { id: score.id } }
    context 'when score exists' do
      it 'deletes the score' do
        sign_in user
        expect { subject }.to change(Score, :count).by(-1)
        expect { score.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
