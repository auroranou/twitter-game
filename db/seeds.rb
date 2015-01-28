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
	{body: "Who has more followers?", parameter: "followers_count"},
	{body: "Who has been on Twitter longer?", parameter: "creation_date"},
	{body: "Who has tweeted more?", parameter: "statuses_count"},
	{body: "Who follows more people?", parameter: "friends_count"}
])

Answer.create(user_id: users[0].id, question_id: questions[0].id, is_correct?: true)

tweeters = Tweeter.create([
	{name: 'Katy Perry', username: 'katyperry'},
	{name: 'Justin Bieber', username: 'justinbieber'},
	{name: 'Barack Obama', username: 'BarackObama'},
	{name: 'Taylor Swift', username: 'taylorswift13'},
	{name: 'YouTube', username: 'YouTube'},
	{name: 'Lady Gaga', username: 'ladygaga'},
	{name: 'Justin Timberlake', username: 'jtimberlake'},
	{name: 'Britney Spears', username: 'britneyspears'},
	{name: 'Rihanna', username: 'rihanna'},
	{name: 'The Ellen Show', username: 'TheEllenShow'},
	{name: 'Instagram', username: 'instagram'},
	{name: 'Twitter', username: 'twitter'},
	{name: 'Cristiano Ronaldo', username: 'Cristiano'},
	{name: 'Jennifer Lopez', username: 'JLo'},
	{name: 'Shakira', username: 'shakira'},
	{name: 'Demi Lovato', username: 'ddlovato'},
	{name: 'Oprah Winfrey', username: 'Oprah'},
	{name: 'Kim Kardashian West', username: 'KimKardashian'},
	{name: 'Selena Gomez', username: 'selenagomez'},
	{name: 'P!nk', username: 'Pink'},
	{name: 'Ariana Grande', username: 'ArianaGrande'},
	{name: 'Harry Styles', username: 'Harry_Styles'},
	{name: 'CNN Breaking News', username: 'cnnbrk'},
	{name: 'One Direction', username: 'onedirection'},
	{name: 'Kaka', username: 'KAKA'},
	{name: 'Adele', username: 'OfficialAdele'},
	{name: 'Niall Horan', username: 'NiallOfficial'},
	{name: 'Jimmy Fallon', username: 'jimmyfallon'},
	{name: 'Alicia Keys', username: 'aliciakeys'},
	{name: 'Bruno Mars', username: 'BrunoMars'},
	{name: 'Drake', username: 'Drake'},
	{name: 'Bill Gates', username: 'BillGates'},
	{name: 'Pitbull', username: 'pitbull'},
	{name: 'Liam Payne', username: 'Real_Liam_Payne'},
	{name: 'Miley Cyrus', username: 'MileyCyrus'},
	{name: 'Lil Wayne', username: 'LilTunechi'},
	{name: 'Eminem', username: 'Eminem'},
	{name: 'Nicki Minaj', username: 'NICKIMINAJ'},
	{name: 'Louis Tomlinson', username: 'Louis_Tomlinson'},
	{name: 'LeBron James', username: 'KingJames'},
	{name: 'Wiz Khalifa', username: 'wizkhalifa'},
	{name: 'Avril Lavigne', username: 'AvrilLavigne'},
	{name: 'Ashton Kutcher', username: 'aplusk'},
	{name: 'David Guetta', username: 'davidguetta'}
	# {name: 'Neymar Jr.', username: 'neymarjr'},
	# {name: 'CNN', username: 'CNN'},
	# {name: 'Emma Watson', username: 'EmWatson'},
	# {name: 'Mariah Carey', username: 'MariahCarey'},
	# {name: 'Kevin Hart', username: 'KevinHart4real'},
	# {name: 'The New York Times', username: 'nytimes'}
])


