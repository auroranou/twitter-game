User.destroy_all
Group.destroy_all

users = User.create([
	{email: 'bob@email.com', password: 'password'},
	{email: 'andy@email.com', password: 'password'},
	{email: 'george@email.com', password: 'password'}
])

groups = Group.create([
	{name: 'Team 1'},
	{name: 'Team 2'}
])

Group.all[0].users << User.first
Group.all[0].users << User.last
Group.all[1].users << User.all[1]