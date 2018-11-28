module SessionsHelper
  def current_user
    #@current_userがnilならログインしているユーザーのidをセッションから代入
    @current_user ||= User.find_by(id: session[:user_id])
    #セッションが空なら空白を代入
    # @current_user ||= {"id" => 0}
  end

  def logged_in?
    current_user.present?
    # && current_user.id != 0
  end
end
