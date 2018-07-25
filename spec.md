Specifications for the Sinatra Assessment
Specs:

[X]Use Sinatra to build the app
-required and utilized.
[X]Use ActiveRecord for storing information in a database
-required and utilized, along with associations of models
[X]Include more than one model class (list of model class names e.g. User, Post, Category)
-Models: User and Plane.
[X]Include at least one has_many relationship on your User model (z has_many y, e.g. User has_many Posts)
-User has_many :planes.
[X]Include at least one belongs_to relationship on another model (z belongs_to y, e.g. Post belongs_to User)
-Plane belongs_to :user.
[X]Include user accounts
-users register and apply session[:user_id].
[X]Ensure that users can't modify content created by other users
-helper methods combine with logic blocks to prevent routing to associated edit/delete functions.
[X]Ensure that the belongs_to resource has routes for Creating,   Reading, Updating and Destroying
-views/planes and planes_controller provide for CRUD operations.
[X]Include user input validations
-can not leave form fields blank, and will generate errors upon failed login or duplicate username sign ups.
[X]Display validation failures to user with error message (example form URL e.g. /posts/new)
-required messages arise on empty fields and failed login/signups redirect to an error page and display associated error messages.
[X]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
-readme has a description, basic install instructions, a message concerning contribution, and a reference to the license file/type.
Confirm

[X]You have a large number of small Git commits
-several commits made throughout.
[X]Your commit messages are meaningful
-messages describe edits in a "will: add signup page" format.
[X]You made the changes in a commit that relate to the commit message
-commit messages outline changes made, appropriately.
[X]You don't include changes in a commit that aren't related to the commit message
-attempted to keep description messages in line with alterations made.
