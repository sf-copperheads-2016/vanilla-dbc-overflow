class CreatePosts < ActiveRecord::Migration
  def change
    create_table   :posts do |t|
      t.string     :title, :body, :type
      t.integer    :user_id, :vote_sum
      t.references :question, :answer, index: true
      t.boolean    :best_answer, default: false

      t.timestamps(null: false)
    end
  end
end
