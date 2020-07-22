class Book
 attr_reader  :title,
              :author
  def initialize(data)
    @title = data[:title]
    @author = data[:author_first_name] + " " + data[:author_last_name]

  end

end
