class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendances
  has_many :attenders, through: :attendances, class_name: "User"

  scope :upcoming,  -> { where("date > :now", now: Time.zone.now) }
  scope :past,      -> { where("date <= :now", now: Time.zone.now) }

end
