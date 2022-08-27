feature 'Sign out', :devise do
  scenario 'user signs out successfully', js: true do
    user = FactoryBot.create(:user)
    user.confirm
    signin(user.email, user.password)
    expect(page).to have_css("#toast-container", text: I18n.t('devise.sessions.signed_in')) 
    
    click_link 'Log out'
    expect(page).to have_css("#toast-container", text: I18n.t('devise.sessions.signed_out')) 
  end
end
