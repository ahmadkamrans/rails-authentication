feature 'Reset Password', :devise do
  scenario 'user receives reset password instructions', js: true do
    user = FactoryBot.create(:user)
    user.confirm
    visit '/users/password/new'
    fill_in 'user_email', with: user.email
    
    expect do
      click_button('Send me reset password instructions')
    end.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
