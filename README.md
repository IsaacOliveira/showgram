# ShowGram

An application that uses the instagram API to show the users photos.

# Running the project

A running instance of project is available at: https://showoffgram.herokuapp.com

To run local will just need to clone the project then run:

```
bundle install
rake db:setup
rails s
```

You should set the Instagram API Configurations and the redirect url in the ENV, (ENV['CLIENT_SECRET'],  ENV['CLIENT_ID'], ENV['REDIRECT_URL'])
Then access: http://localhost:3000

# Running the Specs

After you run bundle, you are ready to run the specs
Them to run all the specs:

```
rspec .
```