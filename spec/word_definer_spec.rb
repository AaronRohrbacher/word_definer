require('rspec')
require('word_definer')
require('pry')

describe('Word#list') do
  before() do
    Word.clear()
  end
  it('Adds inputted words to a list') do
    word = Word.new({:word=>"Concatenate"})
    @list = Word.all()
    word.save()
    expect(@list[0].word).to eq("Concatenate")
  end
end

describe('Define#list') do
  before() do
    Define.clear()
  end
  it('Allows a definition to be added to a given word') do
    definition = Define.new({:definition => "Puts things together", :word_id => 0})
    @definition_list = Define.all()
    definition.save()
    expect(@definition_list[0].definition).to eq("Puts things together")
  end
end
