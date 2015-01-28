class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
    	t.string :name
    	t.string :username
    	t.integer :followers_count
      t.timestamps null: false
    end
  end
end
