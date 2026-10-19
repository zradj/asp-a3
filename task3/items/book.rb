class Book < LibraryItem
  attr_reader :isbn, :genre, :page_count

  def initialize(title:, author:, publication_year:, isbn:, genre:, page_count:)
    super(title: title, author: author, publication_year: publication_year)
    @isbn = isbn
    @genre = genre
    @page_count = page_count
  end

  def display_info
    puts 'Book{#{self.item_info}, isbn="#{@isbn}", genre="#{@genre}", page_count="#{@page_count}"}'
  end
end
