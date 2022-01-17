class Friendship < ApplicationRecord
  belongs_to :requested, class_name: "User", optional: true, foreign_key: "requested_id"
  belongs_to :requester, class_name: "User", optional: true, foreign_key: "requester_id"
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    completed: 3
  }
end
