class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
    	t.string :name
    	t.string :username
    	t.string :twitter_id
    	t.integer :follower_count
      t.timestamps null: false
    end
  end
end
