class Author
 attr_reader  :name,
              :books
  def initialize(name)
    @name = name[:first_name] + " " + name[:last_name]
    @books = []
  end

  def write(title, publication_year)
    author_array = @name.gsub(/\s+/m, ' ').strip.split(" ")
      Book.new({
      author_first_name: author_array[0],
      author_last_name: author_array[1],
      publication_date: publication_year,
      title: title
      })
  end


end
