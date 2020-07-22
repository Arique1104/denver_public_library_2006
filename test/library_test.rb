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

    charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    charlotte_bronte.write("The Professor", "1857")

    charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)

    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors

    assert_equal 4, dpl.books.count

  end

  def test_it_can_create_publication_time_frame_by_author
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    charlotte_bronte.write("The Professor", "1857")

    charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)

    dpl.add_author(harper_lee)

    expect1 = {:start=>"1847", :end=>"1857"}
    assert_equal expect1, dpl.publication_time_frame_for(charlotte_bronte)

    expect2 = {:start=>"1960", :end=>"1960"}
    assert_equal expect2, dpl.publication_time_frame_for(harper_lee)
  end

  def test_it_can_checkout_books
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal false, dpl.checkout(mockingbird)

    assert_equal false, dpl.checkout(jane_eyre)

    dpl.add_author(charlotte_bronte)

    dpl.add_author(harper_lee)

    assert_equal true, dpl.checkout(jane_eyre)

  end



end
