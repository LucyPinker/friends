class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :received_friendship_requests, class_name: "Friendship", foreign_key: "requested_id", dependent: :destroy
  has_many :sent_friendship_requests, class_name: "Friendship", foreign_key: "requester_id", dependent: :destroy

    def requester?
    user_type == "requester"
  end

  def requested?
    user_type == "requested"
  end

  def friendships
    Friendship.where("requested_id = ? OR requester_id = ?", self.id, self.id)
  end
end
