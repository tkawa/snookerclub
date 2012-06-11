# coding: utf-8
class SessionsController < ApplicationController

  #----------#
  # callback #
  #----------#
  def callback
    auth = request.env["omniauth.auth"]
    account = Account.where( provider: auth["provider"], uid: auth["uid"] ).first || Account.create_with_omniauth( auth )
    session[:account_id] = account.id

    redirect_to :root, notice: "ログインしました。"
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    session[:account_id] = nil

    redirect_to :root, notice: "ログアウトしました。"
  end

  #---------#
  # failure #
  #---------#
  def failure
    render text: "<span style='color: red;'>Auth Failure</span>"
  end

end
