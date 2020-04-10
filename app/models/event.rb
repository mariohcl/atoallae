class Event < ApplicationRecord
  belongs_to :user
  belongs_to :page

  acts_as_votable
end
