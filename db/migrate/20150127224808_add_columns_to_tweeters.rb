class AddColumnsToTweeters < ActiveRecord::Migration
  def change
  	add_column :tweeters, :creation_date, :string
  	add_column :tweeters, :friends_count, :string
  	add_column :tweeters, :statuses_count, :string
  end
end
