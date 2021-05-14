class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :started_playing, :score, :time_spent
end
