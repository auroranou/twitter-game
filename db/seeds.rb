User.destroy_all
Group.destroy_all
GroupsUser.destroy_all
Question.destroy_all

users = User.create([
	{email: 'bob@email.com', password: 'password'},
	{email: 'andy@email.com', password: 'password'},
	{email: 'george@email.com', password: 'password'}
])

groups = Group.create([
	{name: 'Team 1'},
	{name: 'Team 2'}
])

GroupsUser.create([
	{user_id: users[0].id, group_id: groups[0].id, is_owner?: false},
	{user_id: users[1].id, group_id: groups[0].id, is_owner?: false},
	{user_id: users[2].id, group_id: groups[0].id, is_owner?: true},
	{user_id: users[0].id, group_id: groups[1].id, is_owner?: true}
	])

questions = Question.create([
	{body: "Who has more followers?"},
	{body: "Which hashtag is trending more?"},
	{body: "Which tweet is favorited the most?"}
	])

Answer.create(user_id: users[0].id, question_id: questions[0].id, is_correct?: true)

tweeters = Tweeter.create([
	{name: 'Katy Perry', username: 'katyperry', twitter_id: , follower_count: },
	{name: 'Justin Bieber', username: 'justinbieber', twitter_id: , follower_count: },
	{name: 'Barack Obama', username: 'BarackObama', twitter_id: , follower_count: },
	{name: 'Taylor Swift', username: 'taylorswift13', twitter_id: , follower_count: },
	{name: 'YouTube', username: 'YouTube', twitter_id: , follower_count: },
	{name: 'Lady Gaga', username: 'ladygaga', twitter_id: , follower_count: },
	{name: 'Justin Timberlake', username: 'jtimberlake', twitter_id: '', follower_count: ''},
	{name: 'Britney Spears', username: 'britneyspears', twitter_id: '', follower_count: ''},
	{name: 'Rihanna', username: 'rihanna', twitter_id: '', follower_count: ''},
	{name: 'The Ellen Show', username: 'TheEllenShow', twitter_id: '', follower_count: ''},
	{name: 'Instagram', username: 'instagram', twitter_id: '', follower_count: ''},
	{name: 'Twitter', username: 'twitter', twitter_id: '', follower_count: ''},
	{name: 'Cristiano Ronaldo', username: 'Cristiano', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},
	{name: '', username: '', twitter_id: '', follower_count: ''},

	])


