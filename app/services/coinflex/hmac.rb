require 'dotenv'
Dotenv.load '.env.local'

module Coinflex
  module HMAC
    def signature(secret_key, access_key, timestamp, nonce, verb, path, method, body)
      msg =
        msg_string(timestamp: timestamp, nonce: nonce, verb: verb,
                   path: path, method: method, body: body)
      hmac =
        OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'), secret_key, msg)

      Base64.strict_encode64(hmac)
    end

    def msg_string(timestamp:, nonce:, verb:, path:, method:, body:)
      b = body.to_s
      timestamp + "\n" + nonce + "\n" + verb + "\n" +
        path + "\n" + method + "\n" + b
    end

    def header(nonce, verb, path, method, body, staging, api_key_slug)
      access_key = api_key(staging: staging, slug: api_key_slug)
      t = timestamp
      signature = signature(
        api_secret(staging: staging, slug: api_key_slug),
        access_key, t, nonce,
        verb, path, method, body)

      {
        'Content-Type' => 'application/json',
        'AccessKey' => access_key,
        'Timestamp' => t,
        'Signature' => signature,
        'Nonce' => nonce
      }
    end

    def api_key(slug:'SG1', op:'READ', staging: )
      perm = if staging
               "TESTER"
             elsif op == 'READ'
               "READER"
             elsif op == 'WRIT'
               "WRITER"
             end
      api_key_var = "#{slug}_API_#{perm}_KEY"

      ENV[api_key_var]
    end

    def api_secret(slug:'SG1', op:'READ', staging: )
      perm = if staging
               "TESTER"
             elsif op == 'READ'
               "READER"
             elsif op == 'WRIT'
               "WRITER"
             end
      api_secret_var = "#{slug}_API_#{perm}_SECRET"

      ENV[api_secret_var]
    end

    def timestamp
      Time.now.utc.strftime('%Y-%m-%dT%H:%M:%S.%6N')
    end
  end
end
