# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :score_total, :time_spent_total, :total_played

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def time_spent_total
    Time.at(object.time_spent_total.to_i).utc.strftime('%H:%M:%S')
  end
end
