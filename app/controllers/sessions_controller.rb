class SessionsController < Clearance::SessionsController

  #sessions controller for /auth/:provider/callback
  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    #request.env["omniauth.auth"\ returns data about the user in an authentication hash:

    #<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1495385587 token="EAAFqckahhdgBAOhtv7KBD0vhY71Lo6ghzNyY0tyYsp1wDlzBztwiPPM7d7mRbB4b8ZAtJSEjepEf2kTZBBYamUKqjzUc1ib4T3xreLGtutOebbOI3nQMsuSssjzJmsy1jGA9mvVIjSrC6ZCwaHpzubyBEbQSTEZD"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash email="rachaellhe2@hotmail.com" id="10155144021724993" name="Rachael Ling">> info=#<OmniAuth::AuthHash::InfoHash email="rachaellhe2@hotmail.com" image="http://graph.facebook.com/v2.6/10155144021724993/picture" name="Rachael Ling"> provider="facebook" uid="10155144021724993">

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "You are signed in again with facebook!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = edit_user_path(user)
      @notice = "Signed in first time with facebook"
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end

end
