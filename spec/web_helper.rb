def sign_up(email: 'julio@example.com',
              user_name: 'jgt',
              name: "Julio",
              password: 'password',
              password_confirmation: 'password')
    visit '/users/new'
    fill_in :user_name, with: user_name
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
