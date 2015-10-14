# README

http://rubyblogs.herokuapp.com/

* all uploaded files will be lost after new commit =(

### Db fixtures

Generate tags first for them to be used in posts, articles or events.

'rake populate:tags'
'rake populate:posts'
'rake populate:articles'
'rake populate:events'

or

'rake populate:all'

### Database 

`rake db:migrate`

### Run

`bundle exec thin start -p $PORT`

Released under the MIT license