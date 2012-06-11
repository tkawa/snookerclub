class Play < ActiveRecord::Base
  belongs_to :account
  attr_accessible :ends_at, :note, :starts_at, :table_id

  scope :current, lambda {|time| where("starts_at <= ? AND (ends_at IS NULL OR ends_at > ?)", time, time) }

  def username
    account.try(:name) || I18n.t('customer')
  end
end
