class Play < ActiveRecord::Base
  attr_accessible :ends_at, :note, :starts_at, :table_id
end
