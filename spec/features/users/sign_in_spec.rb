feature 'Sign in', :devise do
  scenario 'user cannot sign in if not registered', js: true do
    signin('test@example.com', 'password')
    expect(page).to have_css("#toast-container", text: I18n.t('devise.failure.not_found_in_database', authentication_keys: 'Email')) 
  end

  scenario 'user can sign in with valid credentials', js: true do
    user = FactoryBot.create(:user)
    user.confirm
    signin(user.email, user.password)
    expect(page).to have_css("#toast-container", text: I18n.t('devise.sessions.signed_in')) 
  end

  scenario 'unconfirmed user cannot sign in with valid credentials', js: true do
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
    expect(page).to have_css("#toast-container", text: I18n.t('devise.failure.unconfirmed')) 
  end

  scenario 'user cannot sign in with invalid email', js: true do
    user = FactoryBot.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_css("#toast-container", text: I18n.t('devise.failure.not_found_in_database', authentication_keys: 'Email')) 
  end

  scenario 'user cannot sign in with invalid password', js: true do
    user = FactoryBot.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_css("#toast-container", text: I18n.t('devise.failure.invalid', authentication_keys: 'Email')) 
  end
end
