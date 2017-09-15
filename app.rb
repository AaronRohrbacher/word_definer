require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_definer')
# require('pry')
# require('capybara')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  word_input = params["word_input"]
  new_word = Word.new({:word => word_input})
  new_word.save()
  @list = Word.all()
  erb(:input)
end
