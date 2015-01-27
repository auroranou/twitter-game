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
	{name: 'Katy Perry', username: 'katyperry', twitter_id: , follower_count: 63_655_997 },
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
	{name: 'Jennifer Lopez', username: 'JLo', twitter_id: '', follower_count: ''},
	{name: 'Shakira', username: 'shakira', twitter_id: '', follower_count: ''},
	{name: 'Demi Lovato', username: 'ddlovato', twitter_id: '', follower_count: ''},
	{name: 'Oprah Winfrey', username: 'Oprah', twitter_id: '', follower_count: ''},
	{name: 'Kim Kardashian West', username: 'KimKardashian', twitter_id: '', follower_count: ''},
	{name: 'Selena Gomez', username: 'selenagomez', twitter_id: '', follower_count: ''},
	{name: 'P!nk', username: 'Pink', twitter_id: '', follower_count: ''},
	{name: 'Ariana Grande', username: 'ArianaGrande', twitter_id: '', follower_count: ''},
	{name: 'Harry Styles', username: 'Harry_Styles', twitter_id: '', follower_count: ''},
	{name: 'CNN Breaking News', username: 'cnnbrk', twitter_id: '', follower_count: ''},
	{name: 'One Direction', username: 'onedirection', twitter_id: '', follower_count: ''},
	{name: 'Kaka', username: 'KAKA', twitter_id: '', follower_count: ''},
	{name: 'Adele', username: 'OfficialAdele', twitter_id: '', follower_count: ''},
	{name: 'Niall Horan', username: 'NiallOfficial', twitter_id: '', follower_count: ''},
	{name: 'Jimmy Fallon', username: 'jimmyfallon', twitter_id: '', follower_count: ''},
	{name: 'Alicia Keys', username: 'aliciakeys', twitter_id: '', follower_count: ''},
	{name: 'Bruno Mars', username: 'BrunoMars', twitter_id: '', follower_count: ''},
	{name: 'Drake', username: 'Drake', twitter_id: '', follower_count: ''},
	{name: 'Bill Gates', username: 'BillGates', twitter_id: '', follower_count: ''},
	{name: 'Pitbull', username: 'pitbull', twitter_id: '', follower_count: ''},
	{name: 'Liam Payne', username: 'Real_Liam_Payne', twitter_id: '', follower_count: ''},
	{name: 'Miley Cyrus', username: 'MileyCyrus', twitter_id: '', follower_count: ''},
	{name: 'Lil Wayne', username: 'LilTunechi', twitter_id: '', follower_count: ''},
	{name: 'Eminem', username: 'Eminem', twitter_id: '', follower_count: ''},
	{name: 'Nicki Minaj', username: 'NICKIMINAJ', twitter_id: '', follower_count: ''},
	{name: 'Louis Tomlinson', username: 'Louis_Tomlinson', twitter_id: '', follower_count: ''},
	{name: 'LeBron James', username: 'KingJames', twitter_id: '', follower_count: ''},
	{name: 'Wiz Khalifa', username: 'wizkhalifa', twitter_id: '', follower_count: ''},
	{name: 'Avril Lavigne', username: 'AvrilLavigne', twitter_id: '', follower_count: ''},
	{name: 'Ashton Kutcher', username: 'aplusk', twitter_id: '', follower_count: ''},
	{name: 'David Guetta', username: 'davidguetta', twitter_id: '', follower_count: ''},
	{name: 'Neymar Jr.', username: 'neymarjr', twitter_id: '', follower_count: ''},
	{name: 'CNN', username: 'CNN', twitter_id: '', follower_count: ''},
	{name: 'Emma Watson', username: 'EmWatson', twitter_id: '', follower_count: ''},
	{name: 'Mariah Carey', username: 'MariahCarey', twitter_id: '', follower_count: ''},
	{name: 'Kevin Hart', username: 'KevinHart4real', twitter_id: '', follower_count: ''},
	{name: 'The New York Times', username: 'nytimes', twitter_id: '', follower_count: ''}
])


