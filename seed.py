from models import db, User, Resort, Favorite, Search
from app import app
import datetime


# if exists drop and create
db.drop_all()
db.create_all()

# User.query.delete()

# # create users
# zucc = User(first_name='Mark', last_name='Zuckerberg', image_url='https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg/440px-Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg')
# lebron = User(first_name='LeBron', last_name='James', image_url='https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/LeBron_James_crop.jpg/220px-LeBron_James_crop.jpg')
# jack = User(first_name='Jack', last_name='Black', image_url='https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Jack_Black_2011_2.jpg/340px-Jack_Black_2011_2.jpg')

# # Add new objects to session
# db.session.add_all([zucc, lebron, jack])


# # create posts
# zucc_post1 = Post(title="I am a real human!", 
#                  content="Why doesn't anyone belive that I am human!?",
#                  created_at=datetime.datetime(2022, 12, 2),
#                  user_id=1)

# zucc_post2 = Post(title="Mmmmm Water", 
#                  content="I love water it sure feels good on my circuits",
#                  created_at=datetime.datetime(2022, 12, 2),
#                  user_id=1)

# lebron_post1 = Post(title="Trading my Son", 
#                  content="Bronny didn't make it into the NBA, so I'm trading him.",
#                  created_at=datetime.datetime(2022, 6, 2),
#                  user_id=2)

# lebron_post2 = Post(title="I am in the new space jam", 
#                  content="Go watch space jam. I am in it.",
#                  created_at=datetime.datetime(2022, 12, 4),
#                  user_id=2)
      
# jack_post = Post(title="YABBA DA DEEBLE DOOO HYEAHAHAHAH", 
#                  content="AAAAAAAAAAAAAAAAAAAA",
#                  created_at=datetime.datetime(2022, 5, 4),
#                  user_id=3)           

# db.session.add_all([zucc_post1, zucc_post2, lebron_post1, lebron_post2, jack_post])


# # create tags
# cool = Tag(name='cool')
# hot = Tag(name='hot')

# db.session.add_all([cool, hot])

# # commit all 
# db.session.commit()
