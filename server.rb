require 'sinatra'
require 'sinatra/reloader'
require 'googlebooks'

class Book
  attr_reader :title, :author, :image, :link
  def initialize(title, author, image, link)
    @title = title
    @author = author
    @image = image
    @link = link
  end
end

get '/' do
  erb :index
end

post '/book' do
    query = params[:query]
    book = GoogleBooks.search(query)
    @book = Book.new(book.first.title,book.first.authors,book.first.image_link, book.first.info_link)
    erb :book
end
