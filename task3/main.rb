class LibraryItem
  attr_reader :title, :author, :publication_year

  def initialize(title, author, publication_year)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  def item_info
    %Q[title: "#{@title}", author: "#{@author}", publication_year: "#{@publication_year}"]
  end

  def display_info
    puts %Q[LibraryItem { #{self.item_info} }]
  end
end

class Book < LibraryItem
  attr_reader :isbn, :genre, :page_count

  def initialize(title, author, publication_year, isbn, genre, page_count)
    super(title, author, publication_year)
    @isbn = isbn
    @genre = genre
    @page_count = page_count
  end

  def display_info
    puts %Q[Book { #{self.item_info}, isbn: "#{@isbn}", genre: "#{@genre}", page_count: "#{@page_count}" }]
  end
end


class DVD < LibraryItem
  attr_reader :genre, :length_mins

  def initialize(title, author, publication_year, genre, length_mins)
    super(title, author, publication_year)
    @genre = genre
    @length_mins = length_mins
  end

  def display_info
    puts %Q[DVD { #{self.item_info}, length_mins: "#{@length_mins}" }]
  end
end

class CD < LibraryItem
  attr_reader :genre, :record_label, :length_secs

  def initialize(title, author, publication_year, genre, record_label, length_secs)
    super(title, author, publication_year)
    @genre = genre
    @record_label = record_label
    @length_secs = length_secs
  end

  def display_info
    puts %Q[CD { #{self.item_info}, record_label: "#{@record_label}", length_secs: "#{@length_secs}" }]
  end
end

class Library
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    @items.delete(item)
  end

  def display_all_items
    @items.each do |item|
      item.display_info
    end
  end
end

# Your implementation goes here
 
# Create instances of different library items
book = Book.new("Concepts of Programming Languages", "Robert Sebesta", 2015, "978-1-56619-909-4", "Programming", 776)
dvd = DVD.new("Inception", "Christopher Nolan", 2010, "Science Fiction", 148)
cd = CD.new("A Day at the Races", "Queen", 1976, "Rock", "Elektra Records", 2664)
 
# Display items individually
book.display_info
dvd.display_info
cd.display_info

puts
 
# Create a library and add items to it
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)
 
# Display information about all items in the library
library.display_all_items
