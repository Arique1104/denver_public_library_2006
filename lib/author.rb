class Author
 attr_reader  :name
  def initialize(name)
    @name = name[:first_name] + " " + name[:last_name]

  end

end
