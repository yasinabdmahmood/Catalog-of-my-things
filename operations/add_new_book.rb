require_relative '../src/book/book'
require_relative '../src/label/label'
require_relative '../src/author/author'
require_relative '../utils/helper'
require_relative '../utils/msg'

def add_new_book
  title,
  author_name,
  pub_name,
  pub_date,
  book_status = Helper.ask_for_user_inputs(
    'Enter book\'s name : ',
    'Enter author\'s name : ',
    'Enter publisher\'s name : ',
    'Enter publication date : ',
    'How is book\'s condition (good/bad) : '
  )
  book = Book.new(pub_name, pub_date, book_status)
  label = Label.new(title, 'BOOK')
  label.add_item(book)
  author = Author.new(author_name.split[0], author_name.split[1])
  author.add_item(book)
  [book, label, author]
end
