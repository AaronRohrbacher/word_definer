require('rspec')
require('word_definer')
require('pry')

describe('Word#list') do
  it('Adds inputted words to a list') do
    word = Word.new({:word=>"Concatenate"})
    @list = Word.all()
    word.save()
    expect(@list[0].word).to eq("Concatenate")
  end
end
