# coding: utf-8
class ApplicationController < ActionController::Base

  protect_from_forgery
  
  # httpsリダイレクト
  #before_filter :ssl_redirect if Rails.env.production?
  
  # 未ログインリダイレクト
  #before_filter :authorize
  
  # セッション有効期限延長
  before_filter :reset_session_expires

  private
  
  #--------------#
  # ssl_redirect #
  #--------------#
  # httpsへリダイレクト(Production環境のみ)
  def ssl_redirect
    unless request.env["HTTP_X_FORWARDED_PROTO"].to_s == "https"
      request.env["HTTP_X_FORWARDED_PROTO"] = "https"
      
      redirect_to request.url and return
    end
  end
  
  #-----------#
  # authorize #
  #-----------#
  # ログイン認証
  def authorize
    # セッション／トップコントローラ以外で
    if params[:controller] != "sessions" and params[:controller] != "home"
      # 未ログインであればルートヘリダイレクト
      if session[:account_id].blank?
        redirect_to :root and return
      end
    end
  end
  
  #-----------------------#
  # reset_session_expires #
  #-----------------------#
  # セッション期限延長
  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  #--------------#
  # current_account #
  #--------------#
  def current_account
    @current_account ||= Account.where( id: session[:account_id] ).first
  end

  helper_method :current_account

end
