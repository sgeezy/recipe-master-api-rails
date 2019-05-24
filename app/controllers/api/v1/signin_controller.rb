module Api
  module V1
    class SigninController < ApplicationController

      def create
        user = User.find_by!(email: params[:email])
        if user.authenticate(params[:password])
          payload = { user_id: user.id }
          session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
          tokens = session.login
          response.set_cookie(JWTSessions.access_cookie,
                              value: tokens[:access],
                              httponly: true,
                              secure: Rails.env.production?)
          render json: { csrf: tokens[:csrf] }                            
        else
          not_authorized
        end
      end
    end
  end
end