class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 1}
  validates :name, presence: true
  validate :password_length_greater_than_one

  # def password_length_greater_than_one
  #    if self.password.blank?
  #     errors.add(:password, "Need a password")
  #   end
  # end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    unless new_password == ""
      @password = BCrypt::Password.create(new_password)
      self.password_hash = @password
    end
  end
end
