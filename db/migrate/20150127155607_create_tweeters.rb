class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
    	t.string :name
    	t.string :username
    	t.integer :followers_count
    	t.integer :friends_count
    	t.integer :statuses_count
    	t.string :creation_date
      t.timestamps null: false
    end
  end
end
