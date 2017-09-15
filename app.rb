require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_definer')
require('pry')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  word_input = params["word_input"]
  new_word = Word.new({:word => word_input})
  new_word.save()
  @list = Word.all()
  @show_on_click = true
  erb(:input)
end

get('/define/:id') do
  @id = params["id"]
  @list = Word.all()
  @definition_list = Define.all()
  @word_display = Word.find(@id)
  erb(:define)
end

post('/define/:id') do
  @id = params["id"]
  @word_display = Word.find(@id)
  definition_input = params["definition_input"]
  new_definition = Define.new({:definition => definition_input, :word_id => @id})
  new_definition.save
  @definition_list = Define.all()
  erb(:define)
end
