class Attendance < ApplicationRecord
  belongs_to :attender, class_name: "User"
  belongs_to :event
end
