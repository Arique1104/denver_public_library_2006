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

  #def test_it_has_attributes
  #end

end
