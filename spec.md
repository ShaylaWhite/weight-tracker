Specs:

 Use Sinatra to build the app
[Downloaded Sinatra Gem to build Weight-Tracker]


 Use ActiveRecord for storing information in a database
 [The DM folder contains all of the data]


Include more than one model class (e.g. User, Post, Category)
[My two Models are User and Stat]

Include at least one has_many relationship on your User model (e.g. User has_many Posts)
[User has many stats]

 Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
 [Stat belongs to the user]

 Include user accounts with unique login attribute (username or email)
 [email]


 Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
[The user can create, read, update and delete a stat]

 Ensure that users can't modify content created by other users
 [Used teh helper methods to implement this feature]


 Include user input validations
 [Included validations in the user model]


 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
{I tried =( }


 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
{Yes}


Confirm

 You have a large number of small Git commits [yes]
 Your commit messages are meaningful [yes]
 You made the changes in a commit that relate to the commit message[yes]
 You don't include changes in a commit that aren't related to the commit message[yes]