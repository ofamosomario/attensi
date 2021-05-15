# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Validate required fields' do
    it 'required fields in new user' do
      user = FactoryBot.create(:user)
      user.save
      expect(user).to be_valid
    end

    it 'password minimum 6 characters in an user' do
      user = User.new(
        first_name: 'Mario',
        last_name: 'Leite',
        email: 'mario@gmail.com',
        password: '123'
      )
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'unique email in an user' do
      user = User.create(
        first_name: 'Mario',
        last_name: 'Leite',
        email: 'mario@gmail.com',
        password: '123123'
      )
      user2 = User.create(
        first_name: 'Mario',
        last_name: 'Leite',
        email: 'mario@gmail.com',
        password: '123123'
      )
      user.valid?
      user2.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'validate a valid eMail for user' do
      user = User.create(email: 'mariogmail.com', password: '123123')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end
  end
end
