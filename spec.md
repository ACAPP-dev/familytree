# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category): 5 Models
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): I have multiple has_many relationships.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): I have multiple belongs to relationships.
- [x] Include user accounts with unique login attribute (username or email): Tested-OK
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: Familymembers & relationships (through familymembers) have full CRUD functionality while families and users have partial CRUD functionality at this point.
- [x] Ensure that users can't modify content created by other users: Users can modify familymembers that are part of their family, but cannot access or modify families (and associated familymembers) they don't have access to.
- [x] Include user input validations: Validations are set up for the family, familymember, and user models.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new): Flash messages were set up in several spots.
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
