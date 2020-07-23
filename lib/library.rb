class Library
 attr_reader  :name,
              :authors,
              :checked_out_books
  def initialize(name)
    @name = name
    @authors = []
    @checked_out_books = []
  end

  def books
    @authors.map do |author|
      author.books
    end.flatten
  end

  def add_author(author)
    @authors << author
  end

  def publication_time_frame_for(author)
    sorted_books = author.books.sort { |a,b| a.publication_year  <=> b.publication_year}
    {
      start: sorted_books.first.publication_year,
    end: sorted_books.last.publication_year}
  end

  def checkout(book)
    if books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      true
    else
      false
    end
  end

  def return(book)
    index_of_book = @checked_out_books.find_index(book)
    @checked_out_books.delete_at(index_of_book)
  end

end
