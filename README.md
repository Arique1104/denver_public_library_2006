# Denver Public Library (DPL)

## Preparation

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!

## Iteration 1

Use TDD to create a `Book` class that responds to the following interaction pattern. For the `publication_year` method, assume that the year is always the last four characters of the publication date.

```ruby
require './lib/book'
#=> true

book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})    
#=> #<Book:0x00007fcc021fad08...>

book.title
#=> "To Kill a Mockingbird"

book.author
#=> "Harper Lee"

book.publication_year
#=> "1960"
```

## Iteration 2

Use TDD to create an `Author` class that responds to the following interaction pattern.

The `write` method must take two Strings as arguments and return an instance of `Book`.

```ruby
require './lib/book'
#=> true

require './lib/author'
#=> true

charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})    
#=> #<Author:0x00007fb898081850...>

charlotte_bronte.name
#=> "Charlotte Bronte"

charlotte_bronte.books
#=> []

jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
#=> #<Book:0x00007fb896e22538...>

jane_eyre.class
#=> Book

jane_eyre.title
#=> "Jane Eyre"

charlotte_bronte.write("Villette", "1853")
#=> #<Book:0x00007fb8980aaca0...>

charlotte_bronte.books
#=> [#<Book:0x00007fb896e22538...>, #<Book:0x00007fb8980aaca0...>]
```

## Iteration 3

Use TDD to create a `Library` class that responds to the following interaction pattern.

The `publication_time_frame_for` method takes an `Author` object as an argument and returns a hash with two key/value pairs:
  * `:start` which points to the publication year of the `Author`'s first book.
  * `:end` which points to the publication year of the `Author`'s last book.

```ruby
require './lib/library'
#=> true

require './lib/author'
#=> true

dpl = Library.new("Denver Public Library")    
#=> #<Library:0x00007fbeea3653c0...>

dpl.name
#=> "Denver Public Library"

dpl.books
#=> []

dpl.authors
#=> []

charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
#=> #<Author:0x00007fbeea2d78b8...>

charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
#=> #<Book:0x00007fbeeb3beca8...>

professor = charlotte_bronte.write("The Professor", "1857")    
#=> #<Book:0x00007fbeea8efd90...>

villette = charlotte_bronte.write("Villette", "1853")    
#=> #<Book:0x00007fbeea24fbe8...>

harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
#=> #<Author:0x00007fbeea112730...>

mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")    
#=> #<Book:0x00007fbeeb1089f0...>

dpl.add_author(charlotte_bronte)

dpl.add_author(harper_lee)    

dpl.authors
=> [#<Author:0x00007fbeea2d78b8...>, #<Author:0x00007fbeea112730...>]

dpl.books
=> [#<Book:0x00007fbeeb3beca8...>, #<Book:0x00007fbeea8efd90...>, #<Book:0x00007fbeea24fbe8...>, #<Book:0x00007fbeeb1089f0...>]

dpl.publication_time_frame_for(charlotte_bronte)
#=> {:start=>"1847", :end=>"1857"}

dpl.publication_time_frame_for(harper_lee)
#=> {:start=>"1960", :end=>"1960"}
```

## Iteration 4

Use TDD to implement the following methods on the `Library` class:

The `checkout` method takes a `Book` as an argument. It should return `false` if a `Book` does not exist in the library or it is already checked out. Otherwise, it should return true indicating that the book has been checked out.

The `checked_out_books` method should return an array of books that are currently checked out.

The `return` method takes a `Book` as an argument. Calling this method means that a book is no longer checked out.

The `most_popular_book` method should return the book that has been checked out the most.

```ruby
require './lib/library'
#=> true

require './lib/author'
#=> true

dpl = Library.new("Denver Public Library")    
#=> #<Library:0x00007f8c021685b0...>

charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})    
#=> #<Author:0x00007f8c01429a98...>

jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
#=> #<Book:0x00007f8c01433138...>

villette = charlotte_bronte.write("Villette", "1853")    
#=> #<Book:0x00007f8c021d84c8...>

harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
#=> #<Author:0x00007f8c01442520...>

mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")    
#=> #<Book:0x00007f8c019506c0...>

# This book cannot be checked out because it doesn't exist in the library
dpl.checkout(mockingbird)
#=> false

# This book cannot be checked out because it doesn't exist in the library
dpl.checkout(jane_eyre)
#=> false

dpl.add_author(charlotte_bronte)

dpl.add_author(harper_lee)    

dpl.checkout(jane_eyre)
#=> true

dpl.checked_out_books
#=> [#<Book:0x00007f8c01433138...>]

# This book cannot be checked out because it is currently checked out
dpl.checkout(jane_eyre)
#=> false

dpl.return(jane_eyre)

# Returning a book means it should no longer be checked out
dpl.checked_out_books
#=> []

dpl.checkout(jane_eyre)
#=> true

dpl.checkout(villette)    
#=> true

dpl.checked_out_books
#=> [#<Book:0x00007f8c01433138...>, #<Book:0x00007f8c021d84c8...>]

dpl.checkout(mockingbird)
#=> true

dpl.return(mockingbird)    

dpl.checkout(mockingbird)    
#=> true

dpl.return(mockingbird)    

dpl.checkout(mockingbird)    
#=> true

dpl.most_popular_book
#=> #<Book:0x00007f8c019506c0...>
```
