# frozen_string_literal: true

require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

module Calendar
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'SampleCalenderAPI request list'
  CLIENT_SECRETS_PATH = File.join('./client_secret.json')
  CREDENTIALS_PATH = File.join('./googleapis.yaml')
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR

  def authorize
    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    puts 'you need run rake script: bundle exec ruby init_token.rb' if credentials.nil?
    credentials
  end

  def create_service
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize
    service
  end
end
