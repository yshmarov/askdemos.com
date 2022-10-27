# bin/rails generate system_test registration
require 'application_system_test_case'

class RegistrationsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @user.update!(password: '123456789')
  end

  test 'register' do
    visit root_url
    assert_text 'Register'
    click_on 'Register'
    fill_in 'user_email', with: 'hello@corsego.com'
    fill_in 'user_password', with: 'hello@corsego.com'
    fill_in 'user_password_confirmation', with: 'hello@corsego.com'
    click_on 'Sign up'
    assert_text 'Welcome! You have signed up successfully.'
  end
  test 'login' do
    visit root_url
    assert_text 'Register'
    click_on 'Login'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Log in'
    assert_text 'Signed in successfully.'
  end
  test 'logout' do
    sign_in users(:one)
    visit root_url

    assert_no_text 'Log in'
    assert_text 'Log out'
    click_on 'Log out'
    assert_text 'Signed out successfully'
  end
end
