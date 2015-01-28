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
	{body: "Who has more followers?", parameter: "follower_count"},
	{body: "Who has been on twitter longer?", parameter: "creation_date"},
	{body: "Who has tweeted more?", parameter: "status_count"},
	{body: "Who follows more people?", parameter: "friend_count"}
])

Answer.create(user_id: users[0].id, question_id: questions[0].id, is_correct?: true)

tweeters = Tweeter.create([
	{name: 'Katy Perry', username: 'katyperry', follower_count: 63_655_997},
	{name: 'Justin Bieber', username: 'justinbieber', follower_count: 59_523_440},
	{name: 'Barack Obama', username: 'BarackObama', follower_count: 53_602_92},
	{name: 'Taylor Swift', username: 'taylorswift13', follower_count: 51_254_47},
	{name: 'YouTube', username: 'YouTube', follower_count: 47_613_12},
	{name: 'Lady Gaga', username: 'ladygaga', follower_count: 43_781_30},
	{name: 'Justin Timberlake', username: 'jtimberlake', follower_count: 40_581_08},
	{name: 'Britney Spears', username: 'britneyspears', follower_count: 40_510_94},
	{name: 'Rihanna', username: 'rihanna', follower_count: 39_567_24},
	{name: 'The Ellen Show', username: 'TheEllenShow', follower_count: 38_100_01},
	{name: 'Instagram', username: 'instagram', follower_count: 36_633_69},
	{name: 'Twitter', username: 'twitter', follower_count: 33_546_20},
	{name: 'Cristiano Ronaldo', username: 'Cristiano', follower_count: 32_057_77},
	{name: 'Jennifer Lopez', username: 'JLo', follower_count: 30_586_70},
	{name: 'Shakira', username: 'shakira', follower_count: 28_834_81},
	{name: 'Demi Lovato', username: 'ddlovato', follower_count: 26_574_66},
	{name: 'Oprah Winfrey', username: 'Oprah', follower_count: 26_421_36},
	{name: 'Kim Kardashian West', username: 'KimKardashian', follower_count: 26_405_87},
	{name: 'Selena Gomez', username: 'selenagomez', follower_count: 26_367_27},
	{name: 'P!nk', username: 'Pink', follower_count: 25_532_58},
	{name: 'Ariana Grande', username: 'ArianaGrande', follower_count: 24_220_92},
	{name: 'Harry Styles', username: 'Harry_Styles', follower_count: 23_421_50},
	{name: 'CNN Breaking News', username: 'cnnbrk', follower_count: 23_148_17},
	{name: 'One Direction', username: 'onedirection', follower_count: 22_212_90},
	{name: 'Kaka', username: 'KAKA', follower_count: 21_891_84},
	{name: 'Adele', username: 'OfficialAdele', follower_count: 21_654_07},
	{name: 'Niall Horan', username: 'NiallOfficial', follower_count: 21_140_81},
	{name: 'Jimmy Fallon', username: 'jimmyfallon', follower_count: 20_302_23},
	{name: 'Alicia Keys', username: 'aliciakeys', follower_count: 20_169_38},
	{name: 'Bruno Mars', username: 'BrunoMars', follower_count: 19_302_00},
	{name: 'Drake', username: 'Drake', follower_count: 19_234_24},
	{name: 'Bill Gates', username: 'BillGates', follower_count: 19_155_47},
	{name: 'Pitbull', username: 'pitbull', follower_count: 19_128_80},
	{name: 'Liam Payne', username: 'Real_Liam_Payne', follower_count: 19_089_51},
	{name: 'Miley Cyrus', username: 'MileyCyrus', follower_count: 19_021_66},
	{name: 'Lil Wayne', username: 'LilTunechi', follower_count: 19_009_35},
	{name: 'Eminem', username: 'Eminem', follower_count: 19_006_74},
	{name: 'Nicki Minaj', username: 'NICKIMINAJ', follower_count: 18_730_99},
	{name: 'Louis Tomlinson', username: 'Louis_Tomlinson', follower_count: 18_471_00},
	{name: 'LeBron James', username: 'KingJames', follower_count: 18_124_54},
	{name: 'Wiz Khalifa', username: 'wizkhalifa', follower_count: 17_456_13},
	{name: 'Avril Lavigne', username: 'AvrilLavigne', follower_count: 17_413_67},
	{name: 'Ashton Kutcher', username: 'aplusk', follower_count: 16_611_39},
	{name: 'David Guetta', username: 'davidguetta', follower_count: 16_493_72},
	{name: 'Neymar Jr.', username: 'neymarjr', follower_count: 16_435_76},
	{name: 'CNN', username: 'CNN', follower_count: 15_635_71},
	{name: 'Emma Watson', username: 'EmWatson', follower_count: 15_627_09},
	{name: 'Mariah Carey', username: 'MariahCarey', follower_count: 15_302_67},
	{name: 'Kevin Hart', username: 'KevinHart4real', follower_count: 15_113_82},
	{name: 'The New York Times', username: 'nytimes', follower_count: 14_926_58}
])


