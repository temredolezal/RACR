# RACR
RACR app


Install dependencies

	1. You need all the rubygems that the app uses.  Rubygems are libraries of code that other people have written.  You can get them by running "bundle install".



Get the database set up
	1. You need to create a database for your application to use.  Rails can do this for you by running "rake db:create".

	2. Now that your database is created, you need to run the migrations on it so it has all the same tables and columns as it would in production.  Again, Rails can do this for you by running "rake db:migrate".
	
	3. If the owner of this repo was kind enough to add some sample data, you can get it by running "rake db:seed".  This step isn't required, but it will create some dummy data that you can see from the start.



Run the server
	1. This part is easy, just run "rails server"(or "rails s" to save yourself some keystrokes).
