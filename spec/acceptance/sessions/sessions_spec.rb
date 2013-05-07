require 'acceptance/acceptance_helper'

feature "User authentication" do
  scenario "User signs in" do
    sign_in
    page.should have_content("Signed in successfully.")
  end

  scenario "User signs out" do
    sign_in

    click_css('.app-sign-out')

    page.should have_content("Signed out successfully.")
    page.should_not have_content("Sign out")

  end

  scenario "User signs up" do
    visit new_user_registration_path
    fill_in "Email", with: "foo@example.com"
    fill_in "Password", with: "pumpkin123"
    fill_in "Password confirmation", with: "pumpkin123"
    click_button "Sign up"

    page.should have_content("signed up successfully.")
  end

  private
  def sign_in(email="foo@example.com", password="pumkin123")
    User.create!(email: email, password: password)

    visit new_user_session_path

    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end

end
