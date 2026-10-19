class DVD < LibraryItem
  attr_reader :length_mins

  def initialize(title:, author:, publication_year:, length_mins:)
    super(title: title, author: author, publication_year: publication_year)
    @length_mins = length_mins
  end

  def display_info
    puts 'DVD{#{self.item_info}, length_mins="#{@length_mins}"}'
  end
end
