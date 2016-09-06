class BookPresenter < Rectify::Presenter
  attribute :book, Book
  attribute :order_item, OrderItem

  def approved_reviews
    book.reviews.approved_reviews
  end

  def by_authors
    t(:by) if book.authors.any?
  end

  def authors_links
    safe_join(book.authors.map{ |author| link_to author.decorate.full_name, author }, (", ").html_safe)
  end

  def description
    book.full_description.truncate(2000)
  end
end
