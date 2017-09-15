class Word
  attr_reader(:id)
  attr_accessor(:word)

  @@list = []

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = @@list.length + 1
  end

  def self.all
    @@list
  end

  def self.clear
    @@list = []
  end

  def save()
    @@list.push(self)
  end

  def self.find(id)
    id_search = id.to_i
    @@list.each do |word|
      if id_search == word.id
        return word
      end
    end
  end

end

class Define
  attr_reader(:word_id)
  attr_accessor(:definition)

  @@definition_list = []

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
  end

  def self.all()
    @@definition_list
  end

  def save()
    @@definition_list.push(self)
  end

  def self.clear()
    @@definition_list = []
  end
end
