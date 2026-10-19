class CD < LibraryItem
  attr_reader :record_label, :length_secs

  def initialize(title:, author:, publication_year:, record_label:, length_secs:)
    super(title: title, author: author, publication_year: publication_year)
    @record_label = record_label
    @length_secs = length_secs
  end

  def display_info
    puts 'CD{#{self.item_info}, record_label="#{@record_label}", length_secs="#{@length_secs}"}'
  end
end