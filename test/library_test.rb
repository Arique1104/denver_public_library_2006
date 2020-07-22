require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/book"
require "./lib/author"
require "./lib/library"

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new("Denver Public Library")

    assert_instance_of Library, dpl
  end

  def test_it_has_attributes
    dpl = Library.new("Denver Public Library")

    assert_equal "Denver Public Library", dpl.name

    assert_equal [], dpl.books

    assert_equal [], dpl.authors
  end

  def test_it_can_add_authors
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    #=> #<Author:0x00007fbeea2d78b8...>

    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    #=> #<Book:0x00007fbeeb3beca8...>

    charlotte_bronte.write("The Professor", "1857")
    #=> #<Book:0x00007fbeea8efd90...>

    charlotte_bronte.write("Villette", "1853")
    #=> #<Book:0x00007fbeea24fbe8...>

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    #=> #<Author:0x00007fbeea112730...>

    harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    #=> #<Book:0x00007fbeeb1089f0...>

    dpl.add_author(charlotte_bronte)

    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors
    # => [#<Author:0x00007fbeea2d78b8...>, #<Author:0x00007fbeea112730...>]

    assert_equal 4, dpl.books.count
    # => [#<Book:0x00007fbeeb3beca8...>, #<Book:0x00007fbeea8efd90...>, #<Book:0x00007fbeea24fbe8...>, #<Book:0x00007fbeeb1089f0...>]

  end

end
