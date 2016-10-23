require 'spec_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    # expect(page).to have_content('Welcome, julio@example.com')
    expect(User.first.email).to eq('julio@example.com')
  end

  scenario 'with a password that does not match' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq('/users')
    expect(page).to have_content "Please refer to the following errors below: Password does not match the confirmation Please sign up Name: User name: Email: Password: Repeat your password:"
  end

  scenario 'I cannot sign up without an email address' do
    sign_up(email: nil)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    sign_up(email: "invalid@email")
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    sign_up
    expect(page).to have_content('Email is already taken')
  end

  # def sign_up(email: 'julio@example.com',
  #             user_name: 'jgt'
  #
  #               password: 'password',
  #               password_confirmation: 'password')
  #     visit '/users/new'
  #     fill_in :email, with: email
  #     fill_in :password, with: password
  #     fill_in :password_confirmation, with: password_confirmation
  #     click_button 'Sign up'
  # end
end
