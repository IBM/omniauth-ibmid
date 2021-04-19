begin
  require "sinatra"
  require "securerandom"
  require "omniauth"
  require "omniauth-ibmid"
rescue LoadError
  require "rubygems"
  require "securerandom"
  require "sinatra"
  require "omniauth"
  require "omniauth-ibmid"
end

set sessions: true
set :session_secret, ENV.fetch("SESSION_SECRET") { SecureRandom.hex(64) }

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :ibmid, ENV["IBMID_OIDC_CLIENT_ID"], ENV["IBMID_OIDC_CLIENT_SECRET"]
end

get "/" do
  <<-HTML
  <form method='post' action='/auth/ibmid'>
    <input type="hidden" name="authenticity_token" value='#{request.env["rack.session"]["csrf"]}'>
    <button type='submit'>Sign in with IBMid</button>
  </form>
  HTML
end

get "/auth/:name/callback" do
  auth = request.env["omniauth.auth"]
  <<-HTML
  <h1>You are logged in as #{auth["info"]["email"]}</h1>
  <div>OmniAuth::AuthHash::InfoHash</div>
  <span>#{auth["info"].to_json}</span>
  HTML
end
