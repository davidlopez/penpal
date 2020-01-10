# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'roundhouse@kickit.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )
user_2 = User.create(first_name: 'Clark', last_name: 'Kent', email: 'lasereyes@heroes.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )
user_3 = User.create(first_name: 'Santa', last_name: 'Clause', email: 'jollynick@christmas.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )

quote_1 = DbtQuote.create(quote: "Let each situation be what it is instead of what you think it should be")
quote_2 = DbtQuote.create(quote: "I still have a long way to go, but I'm already so far from where I used to be and I'm proud of that")
quote_3 = DbtQuote.create(quote: "Be in the moment, identify the feeling, let it pass like a wave on the beach")
quote_4 = DbtQuote.create(quote: "I am not what has happened to me. I am what I choose to become")
quote_5 = DbtQuote.create(quote: "Find the courage to let go of what you cannot change and discover what is next")

# sad_user_1 = user_1.feelings.create(feeling: 'sad')
# upset_user_1 = user_1.feelings.create(feeling: 'upset')
#
# alone_user_2 = user_1.feelings.create(feeling: 'alone')
# unmotivated_user_2 = user_1.feelings.create(feeling: 'unmotivated')
#
# stuck_user_3 = user_1.feelings.create(feeling: 'stuck')
# upset_user_3 = user_1.feelings.create(feeling: 'upset')
# happy_user_3 = user_1.feelings.create(feeling: 'happy')
#
# sad_user_1.categories.create(category: 'music' )
# upset_user_1.categories.create(category: 'activity' )
# alone_user_2.categories.create(category: 'connect' )
# unmotivated_user_2.categories.create(category: 'journal' )
# stuck_user_3.categories.create(category: 'music' )
# upset_user_3.categories.create(category: 'activity' )
# happy_user_3.categories.create(category: 'music' )
