class Library
 attr_reader  :name,
              :books,
              :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
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

end
