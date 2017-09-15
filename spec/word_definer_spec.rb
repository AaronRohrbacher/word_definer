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
    Word.clear()
  end
  it('Allows a definition to be added to a word') do
    definition = Define.new({:definition => "Puts things together", :word_id => 0})
    @definition_list = Define.all()
    definition.save()
    expect(@definition_list[0].definition).to eq("Puts things together")
  end
  before() do
    Word.clear()
    Define.clear()
  end
  it('Only displays definitions linked to a particular word') do
    word = Word.new(:word =>"Savvy")
    word.save()
    word2 = Word.new(:word => "Whatever")
    word2.save()
    definition = Define.new(:definition => "Displaying Understanding", :word_id => 1)
    definition.save()
    definition2 = Define.new(:definition => "whatever", :word_id =>2)
    definition.save()
    @list = Word.all()
    @definition_list = Define.all()
    word_id_to_find = @list[0].id
    definition_to_test = ""
    @definition_list.each do |definitions|
      if word_id_to_find == definitions.word_id
        definition_to_test = definitions.definition
      end
    end
    expect(definition_to_test).to eq("Displaying Understanding")
  end
end
