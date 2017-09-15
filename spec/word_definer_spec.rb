require('rspec')
require('word_definer')
require('pry')

describe('Word#list') do
  it('Adds inputted words to a list') do
    word = Word.new({:word=>"Contatenate"})
    @list = Word.all()
    expect(@list[0]).to eq("Concatenate")
  end
end
