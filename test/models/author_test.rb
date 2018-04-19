require "test_helper"
require "pry"

describe Author do

  describe "author" do
    it "has books" do
      test_author = Author.where(name: "Sandi Metz")
    end
  end


  # let(:author) { Author.new }
  # let(:book_a) { Book.new publication_year: "2000"}
  # let(:book_b) { Book.new publication_year: "2001"}
  # let(:book_c) { Book.new publication_year: nil}

  # describe "first_published" do
  #
  #   it "should return the year of the earliest published book for the author as an integer" do
  #     book_a.save
  #     book_b.save
  #     book_c.save
  #     author.books << book_a
  #     author.books << book_b
  #     author.books << book_c
  #
  #     author.first_published.must_equal 2000
  #   end
  #
  #   it "should return the string 'NO BOOKS' for the author with no books" do
  #     author.first_published.must_equal "NO BOOKS"
  #   end
  #
  # end

end
