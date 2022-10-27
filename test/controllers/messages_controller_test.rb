require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @inbox = inboxes(:one)
    @message = messages(:one)
  end

  test 'should get index' do
    get inbox_messages_url(@inbox)
    assert_response :success
  end

  test 'should get new' do
    get new_inbox_message_url(@inbox)
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post inbox_messages_url(@inbox),
           params: { message: { body: @message.body, inbox_id: @message.inbox_id, status: @message.status, user_id: @message.user_id } }
    end

    assert_redirected_to inbox_messages_url(@inbox)
  end

  test 'should destroy message' do
    assert_difference('Message.count', -1) do
      delete inbox_message_url(@message.inbox, @message)
    end

    assert_redirected_to inbox_messages_url(@inbox)
  end
end
