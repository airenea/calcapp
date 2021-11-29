module NewtonAPI
    module V2
      class Client
        API_ENDPOINT = 'https://newton.vercel.app/api/v2/'.freeze
  
        attr_reader :oauth_token
  
        def initialize(oauth_token = nil)
          @oauth_token = oauth_token
        end
  
        def simplify(expression)
            expression = expression.gsub("+","%2B")
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
          request(
            http_method: :get,
            endpoint: "simplify/#{expression}"
          )
        end

        def factor(expression)
            expression = expression.gsub("+","%2B")
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "factor/#{expression}"
            )
        end
    
        private
  
        def client
          @_client ||= Faraday.new(API_ENDPOINT) do |client|
            client.request :url_encoded
            client.adapter Faraday.default_adapter
            client.headers['Authorization'] = "token #{oauth_token}" if oauth_token.present?
          end
        end
  
        def request(http_method:, endpoint:, params: {})
          response = client.public_send(http_method, endpoint, params)
          Oj.load(response.body)
        end
      end
    end
  end
  