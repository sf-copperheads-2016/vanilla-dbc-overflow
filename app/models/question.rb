class Question < Post
  # Remember to create a migration!
  validates :title, { presence: true }
  has_many :answers, class_name: "Post"
  has_many :comments, class_name: "Post"
end
