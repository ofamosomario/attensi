# frozen_string_literal: true

class NewUserSerializer < ActiveModel::Serializer
  type 'user'

  attributes :id, :first_name, :last_name
end
