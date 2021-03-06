# apis for oauth2
module Api
  module V1
    class CredentialsController < ApplicationController
      before_action :doorkeeper_authorize!

      respond_to :json

      def me
        respond_with current_resource_owner
      end

      private

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
