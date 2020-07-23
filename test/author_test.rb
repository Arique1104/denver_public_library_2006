require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/book"
require "./lib/author"

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal "Charlotte Bronte", charlotte_bronte.name

    assert_equal [], charlotte_bronte.books
  end

  def test_it_can_create_book_objects
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    charlotte_bronte.write("Jane Eyre", "October 16, 1847")


  end

  def test_it_can_add_books_to_array
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], charlotte_bronte.books


    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, jane_eyre.class

    assert_equal "Jane Eyre", jane_eyre.title

    charlotte_bronte.write("Villette", "1853")

    assert_equal 2, charlotte_bronte.books.count


  end

end
