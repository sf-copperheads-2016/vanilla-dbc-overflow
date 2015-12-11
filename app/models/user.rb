class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true, length: { minimum: 1}
  validates :name, presence: true
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
