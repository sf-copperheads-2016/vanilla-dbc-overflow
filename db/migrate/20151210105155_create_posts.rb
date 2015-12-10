class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :body
      t.integer :user_id, :vote_sum

      t.timestamps(null: false)
    end
  end
end
