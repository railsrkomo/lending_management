class Fellow < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user

  attribute :friend_email, :string
  before_validation :set_friend_email, on: :create

  validates :friend_email, presence: true, on: :create
  validate :friend_email_check


  private
  def set_friend_email
    if user = User.find_by(email: self.friend_email.downcase)
      self.friend_id = user.id
    end
  end

  def friend_email_check
    user = self.user
    # self_email_check
    if user.email == friend_email
      errors.add(:friend_email, "自身のメールアドレスです")
    end
    # check_existing_friends
    emails = user.friends.pluck(:email)
    if friend_email.in?(emails)
      errors.add(:friend_email, "既に登録済みです")
    end
  end

end
