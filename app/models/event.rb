class Event < ApplicationRecord
  belongs_to :user
  belongs_to :page

  mount_uploader :eventimage, EventimageUploader

  acts_as_votable
end
