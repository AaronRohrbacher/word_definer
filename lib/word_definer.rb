class Word
  attr_reader(:id)
  attr_accessor(:word)

  @@list = []

  def initialize(attributes)
    @word = attributes.fetch(:word)
  end

  def self.all
    @@list
  end

  def save()
    @@list.push(self)
  end
end
