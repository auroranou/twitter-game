User.destroy_all
Group.destroy_all
GroupsUser.destroy_alls
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
	{name: 'Katy Perry', username: 'katyperry', follower_count: 63_655_997 },
	{name: 'Justin Bieber', username: 'justinbieber', follower_count: 59_523_440 },
	{name: 'Barack Obama', username: 'BarackObama', follower_count: 53_602_922},
	{name: 'Taylor Swift', username: 'taylorswift13', follower_count: 51_254_478},
	{name: 'YouTube', username: 'YouTube', follower_count: 47_613_128},
	{name: 'Lady Gaga', username: 'ladygaga', follower_count: 43_781_300},
	{name: 'Justin Timberlake', username: 'jtimberlake', follower_count: 40_581_089},
	{name: 'Britney Spears', username: 'britneyspears', follower_count: 40_510_941},
	{name: 'Rihanna', username: 'rihanna', follower_count: 39_567_247},
	{name: 'The Ellen Show', username: 'TheEllenShow', follower_count: 38_100_013},
	{name: 'Instagram', username: 'instagram', follower_count: 36_633_699},
	{name: 'Twitter', username: 'twitter', follower_count: 33_546_208},
	{name: 'Cristiano Ronaldo', username: 'Cristiano', follower_count: 32_057_776},
	{name: 'Jennifer Lopez', username: 'JLo', follower_count: 30_586_702},
	{name: 'Shakira', username: 'shakira', follower_count: 28_834_810},
	{name: 'Demi Lovato', username: 'ddlovato', follower_count: 26_574_665},
	{name: 'Oprah Winfrey', username: 'Oprah', follower_count: 26_421_361},
	{name: 'Kim Kardashian West', username: 'KimKardashian', follower_count: 26_405_870},
	{name: 'Selena Gomez', username: 'selenagomez', follower_count: 26_367_273},
	{name: 'P!nk', username: 'Pink', follower_count: 25_532_586},
	{name: 'Ariana Grande', username: 'ArianaGrande', follower_count: 24_220_920},
	{name: 'Harry Styles', username: 'Harry_Styles', follower_count: 23_421_502},
	{name: 'CNN Breaking News', username: 'cnnbrk', follower_count: 23_148_172},
	{name: 'One Direction', username: 'onedirection', follower_count: 22_212_904},
	{name: 'Kaka', username: 'KAKA', follower_count: 21_891_844},
	{name: 'Adele', username: 'OfficialAdele', follower_count: 21_654_073},
	{name: 'Niall Horan', username: 'NiallOfficial', follower_count: 21_140_819},
	{name: 'Jimmy Fallon', username: 'jimmyfallon', follower_count: 20_302_234},
	{name: 'Alicia Keys', username: 'aliciakeys', follower_count: 20_169_384},
	{name: 'Bruno Mars', username: 'BrunoMars', follower_count: 19_302_005},
	{name: 'Drake', username: 'Drake', follower_count: 19_234_245},
	{name: 'Bill Gates', username: 'BillGates', follower_count: 19_155_478},
	{name: 'Pitbull', username: 'pitbull', follower_count: 19_128_801},
	{name: 'Liam Payne', username: 'Real_Liam_Payne', follower_count: 19_089_510},
	{name: 'Miley Cyrus', username: 'MileyCyrus', follower_count: 19_021_664},
	{name: 'Lil Wayne', username: 'LilTunechi', follower_count: 19_009_353},
	{name: 'Eminem', username: 'Eminem', follower_count: 19_006_749},
	{name: 'Nicki Minaj', username: 'NICKIMINAJ', follower_count: 18_730_990},
	{name: 'Louis Tomlinson', username: 'Louis_Tomlinson', follower_count: 18_471_008},
	{name: 'LeBron James', username: 'KingJames', follower_count: 18_124_541},
	{name: 'Wiz Khalifa', username: 'wizkhalifa', follower_count: 17_456_133},
	{name: 'Avril Lavigne', username: 'AvrilLavigne', follower_count: 17_413_674},
	{name: 'Ashton Kutcher', username: 'aplusk', follower_count: 16_611_396},
	{name: 'David Guetta', username: 'davidguetta', follower_count: 16_493_722},
	{name: 'Neymar Jr.', username: 'neymarjr', follower_count: 16_435_767},
	{name: 'CNN', username: 'CNN', follower_count: 15_635_710},
	{name: 'Emma Watson', username: 'EmWatson', follower_count: 15_627_097},
	{name: 'Mariah Carey', username: 'MariahCarey', follower_count: 15_302_671},
	{name: 'Kevin Hart', username: 'KevinHart4real', follower_count: 15_113_829},
	{name: 'The New York Times', username: 'nytimes', follower_count: 14_926_581}
])


