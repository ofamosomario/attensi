# frozen_string_literal: true

class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :started_playing, :score_value, :time_spent

  def time_spent
    Time.at(object.started_playing.to_i).utc.strftime('%H:%M:%S')
  end

  def started_playing
    object.started_playing.to_time.iso8601
  end
end
