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

end
