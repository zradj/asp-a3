class LibraryItem
  attr_reader :title, :author, :publication_year

  def initialize(title:, author:, publication_year:)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  def item_info
    'title="#{@title}", author="#{@author}", publication_year="#{@publication_year}"'
  end

  def display_info
    puts 'LibraryItem{#{self.item_info}}'
  end
end
