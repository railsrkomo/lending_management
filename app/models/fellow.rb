class Fellow < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  before_validation :set_friend_connect, if: :friend_email
  attribute :friend_email, :string
  validate :friend_email_check, if: :friend_email

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
  def set_friend_connect
    if friend_user = User.find_by(email: self.friend_email.downcase)
      self.friend_id = friend_user.id
    end
  end

  def friend_email_check
    if self.user.email == friend_email
      errors.add(:friend_email, "自身のメールアドレスです")
    elsif self.user.friends.where(email: friend_email).present?
      errors.add(:friend_email, "既に登録済みです")
    end
  end

end
