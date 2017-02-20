require 'googleauth'
require 'google/api_client/client_secrets'
require 'google/apis/oauth2_v2'

class AuthorizationsController < ActionController::API
  def create
    client = Google::APIClient::ClientSecrets.new('web' => {
      # client_id = ENV['GOOGLE_CLIENT_ID'],
      client_id: '526890898606-ck0tqsrl206r4sl3db86qa3oteo1h3u5.apps.googleusercontent.com',
      # client_secret = ENV['GOOGLE_CLIENT_SECRET'],
      client_secret:'Az0U1zI_u5tmGaft2GWuho-_',
      redirect_url:'http://localhost:4200/oauth2callback'
    }).to_authorization

    client.grant_type = 'authorization_code'
    client.code = params['authorization_code']

    token = client.fetch_access_token!

    oauth_client = Google::Apis::OAuth2V2::OAuth2Service.new
    oauth_client.authorization = client
    user_info = oauth_client.get_userinfo

    auth_token = AuthToken.where(email: user_info.email).first_or_create
    auth_token.update(token: token)

    render json: {
      email: user_info.email,
      token: token
    }
  end
end
