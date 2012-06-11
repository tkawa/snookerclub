# coding: utf-8
class Account < ActiveRecord::Base
  has_many :plays
  attr_accessible :provider, :uid, :name, :screen_name, :image, :token, :secret

  private

  #---------------------------#
  # self.create_with_omniauth #
  #---------------------------#
  def self.create_with_omniauth( auth )
    account = Account.new
    account[:provider] = auth["provider"]
    account[:uid] = auth["uid"]

    unless auth["info"].blank?
      account[:name] = auth["info"]["name"]
      account[:screen_name] = auth["info"]["nickname"]
      account[:image] = auth["info"]["image"]
    end
    
    unless auth["credentials"].blank?
      account.token = auth['credentials']['token']
      account.secret = auth['credentials']['secret']
    end

    account.save

    return account
  end

end
