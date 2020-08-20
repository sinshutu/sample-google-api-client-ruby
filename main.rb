# frozen_string_literal: true

require './calender'
include Calendar

# see: https://github.com/googleapis/google-api-ruby-client/blob/master/samples/cli/lib/samples/calendar.rb

def insert_event(calendar)
  event = {
    summary: 'サマリ',
    attendees: [],
    start: {
      date_time: DateTime.parse('2020-08-21 10:00 JST')
    },
    end: {
      date_time: DateTime.parse('2020-08-21 11:00 JST')
    }
  }

  event = calendar.insert_event('primary', event, send_notifications: true)
  puts "Created event '#{event.summary}' (#{event.id})"
  event
end

calendar = create_service
insert_event(calendar)
