class UserHistory < ActiveRecord::Base
  belongs_to      :user
  attr_accessible :entry
end
