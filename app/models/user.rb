class User < ApplicationRecord
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :attendances, foreign_key: "attender_id"
  has_many :attended_events, through: :attendances, source: "event"

  def previous_events
    self.attended_events.where("date < :now", now: Time.zone.now)
  end

  def upcoming_events
    self.attended_events.where("date > :now", now: Time.zone.now)
  end
end
