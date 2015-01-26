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



