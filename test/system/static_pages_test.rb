require 'application_system_test_case'

class StaticPagesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_url

    assert_selector 'h1', text: 'landing_page'
  end
end
