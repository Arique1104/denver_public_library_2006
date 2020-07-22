class Library
 attr_reader  :name,
              :books,
              :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out = []
  end

  def add_author(author)
    author.books.each do |book|
      @books << book
    end
    @authors << author
  end

  def publication_time_frame_for(author)
    # { |a,b| a.length <=> b.length }
    sorted_books = author.books.sort { |a,b| a.publication_year.to_i  <=> b.publication_year.to_i}

    {
      start: sorted_books.first.publication_year,
    end: sorted_books.last.publication_year}
  end

  def checkout(book_check)
    @books.any? do |book|
      if book_check == book && @checked_out.any? {book_check == book}
        @checked_out << book_check
        true
      end
    end
  end



  # The `checkout` method takes a `Book` as an argument. It should return `false` if a `Book` does not exist in the library or it is already checked out. Otherwise, it should return true indicating that the book has been checked out.
  #
  # The `checked_out_books` method should return an array of books that are currently checked out.
  #
  # The `return` method takes a `Book` as an argument. Calling this method means that a book is no longer checked out.
  #
  # The `most_popular_book` method should return the book that has been checked out the most.

end
