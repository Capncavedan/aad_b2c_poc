module OmniAuth
  module Strategies
    class AadB2cStrategy < AzureActiveDirectoryB2C

      option :name, 'aad_b2c_strategy'

      def redirect_uri
        'https://dbuettner.ngrok.io/auth/aad_b2c_strategy/callback'
      end

      def policy_options
        {
          issuer:                   'https://intellumsso1.b2clogin.com/f7ca39b3-64dd-4f04-b8a3-69aa10f27ee5/v2.0/',
          application_identifier:   '6bad8d36-d146-48f6-918c-15adcfebcc9a',  # Azure AD B2C app 'danbssotest2'
          application_secret:       ENV['AAD_B2C_APPLICATION_SECRET'],
          tenant_name:              'intellumsso1',
          tenant_guid:              'f7ca39b3-64dd-4f04-b8a3-69aa10f27ee5',
          policy_name:              'B2C_1_danbtestlogin001',
          scope:                    ["6bad8d36-d146-48f6-918c-15adcfebcc9a", "openid"],
          jwk_signing_keys:         jwk_signing_keys,
          jwk_signing_algorithm:    :RS256,
          idp_redirect_url_format:  'onmicrosoft',
        }
      end

      def jwk_signing_keys
        JSON.parse('{"keys": [{"kid":"X5eXk4xyojNFum1kl2Ytv8dlNP4-c57dO6QGTVBwaNk","nbf":1493763266,"use":"sig","kty":"RSA","e":"AQAB","n":"tVKUtcx_n9rt5afY_2WFNvU6PlFMggCatsZ3l4RjKxH0jgdLq6CScb0P3ZGXYbPzXvmmLiWZizpb-h0qup5jznOvOr-Dhw9908584BSgC83YacjWNqEK3urxhyE2jWjwRm2N95WGgb5mzE5XmZIvkvyXnn7X8dvgFPF5QwIngGsDG8LyHuJWlaDhr_EPLMW4wHvH0zZCuRMARIJmmqiMy3VD4ftq4nS5s8vJL0pVSrkuNojtokp84AtkADCDU_BUhrc2sIgfnvZ03koCQRoZmWiHu86SuJZYkDFstVTVSR0hiXudFlfQ2rOhPlpObmku68lXw-7V-P7jwrQRFfQVXw"}]}')
      end

    end
  end
end
