class Fellow < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  # attribute :status, :string # 双方向の関係かを確認する
  attribute :friend_email, :string
  before_validation :set_friend_email, on: :create

  validates :friend_email, presence: true, on: :create
  validate :friend_email_check

	def relationship
    if self.friend
      if self.friend.friends.find_by(id: self.user.id).present?
        status = "<-->　双方向関係"
      else
        status = "+-->　相手の関係がありません"      
      end
    else
      status = "相手が不明になりました"
    end
    status
	end

  private
  def set_friend_email
    if user = User.find_by(email: self.friend_email.downcase)
      self.friend_id = user.id
    end
  end

  def friend_email_check
    user = self.user
    if user.email == friend_email
      errors.add(:friend_email, "自身のメールアドレスです")
    elsif user.friends.where(email: friend_email).present?
      errors.add(:friend_email, "既に登録済みです")
    else
      true
    end
  end

end
