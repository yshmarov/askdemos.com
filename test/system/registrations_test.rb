# bin/rails generate system_test registration
require 'application_system_test_case'

class RegistrationsTest < ApplicationSystemTestCase
  test 'register' do
    visit registrations_url

    assert_selector 'h1', text: 'Registration'
  end
  test 'login' do
    visit registrations_url

    assert_selector 'h1', text: 'Registration'
  end
  test 'logout' do
    visit registrations_url

    assert_selector 'h1', text: 'Registration'
  end
end
