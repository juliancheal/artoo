require 'oauth2'
module Artoo
  module SecureApi
    class Activation
      attr_reader :token
      def initialize(api_host, api_port, auth_host, auth_port, application_id, secret)
        
        Celluloid::Logger.info "Registering with oauth server..."
        # @token = "f9f6a65731c2715ecb0dc7be9e92406f"
        # ping oauth server with application_id, secret
        @client = OAuth2::Client.new(application_id, secret, :site => "http://#{auth_host}:#{auth_port}", authorize_url: "oauth/new")
      end
      
      def get_token(code)
        puts code
      end
      
      def validate_token(token)
        # @client.token_url({token_url: "/oauth_tests/show_me_the_money"})
        tok = OAuth2::AccessToken.new(@client,{access_token: token})
        token_status = tok.get("/oauth_tests/show_me_the_money").status
        if token_status == 200
          return true
        end
        if token_status.eql("unauthorized")
          return false
        end
      end
      
    end
  end
end