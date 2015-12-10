class Comment < Post
  # Remember to create a migration!
  belongs_to :question, class_name: "Post",
                        foreign_key: "question_id"
  belongs_to :answer, class_name: "Post",
                      foreign_key: "answer_id"
end
