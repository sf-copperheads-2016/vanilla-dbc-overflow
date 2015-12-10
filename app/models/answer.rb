class Answer < Post
  # Remember to create a migration!
  has_many :comments, class_name: "Post",
                      foreign_key: "question_id"
  belongs_to :question, class_name: "Post"
end
