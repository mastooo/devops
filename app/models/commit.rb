class Commit < ActiveRecord::Base
  belongs_to :member
  belongs_to :user
end
