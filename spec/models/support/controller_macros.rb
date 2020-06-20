module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end
#デバイスを入れた時のコントローラーとテストを結ぶ固定文
