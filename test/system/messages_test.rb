require 'application_system_test_case'

class MessagesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @inbox = inboxes(:one)
    @message = messages(:one)
  end

  test 'visiting the index' do
    visit inbox_messages_url(@inbox)
    assert_selector 'h1', text: 'Messages'
  end

  test 'should create message' do
    visit inbox_messages_url(@inbox)
    click_on 'New message'

    fill_in 'Body', with: @message.body
    click_on 'Create Message'

    assert_text 'Message was successfully created'
    click_on 'New message'
  end

  test 'should destroy Message' do
    visit inbox_messages_url(@inbox)
    click_on 'Destroy this message', match: :first

    assert_text 'Message was successfully destroyed'
  end
end
