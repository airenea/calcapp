module NewtonAPI
    module V2
      class Client
        API_ENDPOINT = 'https://newton.vercel.app/api/v2/'.freeze
  
        attr_reader :oauth_token
  
        def initialize(oauth_token = nil)
          @oauth_token = oauth_token
        end

        # SIMPLIFY, FACTOR, DERIVE, INTEGRATE, ABS
        def compute(function, expression)
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "#{function}/#{expression}"
            )
        end

        # SINE, COSINE, TANGENT
        def trig(function, expression)
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "#{function}/#{expression}"
            )
        end

        # ARCSIN, ARCCOS, ARCTAN
        def arctrig(function, expression, radians)
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "#{function}/#{expression}"
            )
            if radians == false
                request.result = request.result.to_i  * 180 / Math::PI
                request.result = request.result.to_s
            end
        end
        
        # AREA UNDER CURVE
        def area_curve(lower, upper, expression)
            lower = lower.gsub("+","%2B").delete(' ')
            lower = lower.gsub("/","(over)")
            lower = lower.gsub("^","%5E")
            upper = upper.gsub("+","%2B").delete(' ')
            upper = upper.gsub("/","(over)")
            upper = upper.gsub("^","%5E")
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            lower = lower.to_i.to_s
            upper = upper.to_i.to_s
            def_integral = lower + ":" + upper + "%7C" + expression
            request(
              http_method: :get,
              endpoint: "area/#{def_integral}"
            )
        end

        # TANGENT
        def tangent(point, expression)
            point = point.gsub("+","%2B").delete(' ')
            point = point.gsub("/","(over)")
            point = point.gsub("^","%5E")
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            point = point.to_i.to_s
            tangent_line = point + "%7C" + expression
            request(
              http_method: :get,
              endpoint: "tangent/#{tangent_line}"
            )
        end

        # LOGARITHM
        def log(base, number)
            base = base.gsub("+","%2B").delete(' ')
            base = base.gsub("/","(over)")
            base = base.gsub("^","%5E")
            number = number.gsub("+","%2B").delete(' ')
            number = number.gsub("/","(over)")
            number = number.gsub("^","%5E")
            base = base.to_i.to_s
            number = number.to_i.to_s
            log_input = base + "%7C" + number
            request(
              http_method: :get,
              endpoint: "log/#{log_input}"
            )
        end

        # ZEROES
        def zeroes(expression)
            expression = expression.gsub("+","%2B").delete(' ')
            expression = expression.gsub("/","(over)")
            expression = expression.gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "zeroes/#{expression}"
            )
        end

        # SOLVE
        def solve(lefthand, righthand)
            lefthand = lefthand.gsub("+","%2B").delete(' ')
            lefthand = lefthand.gsub("/","(over)")
            lefthand = lefthand.gsub("^","%5E")
            righthand = righthand.gsub("+","%2B").delete(' ')
            righthand = righthand.gsub("/","(over)")
            righthand = righthand.gsub("^","%5E")
            expression = lefthand + "-(" + righthand + ")"
            simplified = compute("simplify", expression)
            simplified_result = simplified["result"].gsub("+","%2B").delete(' ').gsub("/","(over)").gsub("^","%5E")
            request(
              http_method: :get,
              endpoint: "zeroes/#{simplified_result}"
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
  