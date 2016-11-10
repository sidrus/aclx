require 'test_helper'

class EventNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_note = event_notes(:one)
  end

  test "should get index" do
    get event_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_event_note_url
    assert_response :success
  end

  test "should create event_note" do
    assert_difference('EventNote.count') do
      post event_notes_url, params: { event_note: { admin_id: @event_note.admin_id, content: @event_note.content, event_id: @event_note.event_id, title: @event_note.title } }
    end

    assert_redirected_to event_note_url(EventNote.last)
  end

  test "should show event_note" do
    get event_note_url(@event_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_note_url(@event_note)
    assert_response :success
  end

  test "should update event_note" do
    patch event_note_url(@event_note), params: { event_note: { admin_id: @event_note.admin_id, content: @event_note.content, event_id: @event_note.event_id, title: @event_note.title } }
    assert_redirected_to event_note_url(@event_note)
  end

  test "should destroy event_note" do
    assert_difference('EventNote.count', -1) do
      delete event_note_url(@event_note)
    end

    assert_redirected_to event_notes_url
  end
end
