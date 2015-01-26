User.destroy_all
Group.destroy_all

users = User.create([
	{email: 'bob@email.com', password: 'password'},
	{email: 'andy@email.com', password: 'password'},
	{email: 'george@email.com', pasword: 'password'}
])

groups = Group.create([
	{group: 'Team 1'},
	{group: 'Team 2'}
])

Group.all[0].users << User.first, User.last
Group.all[1].users << User.all[1]