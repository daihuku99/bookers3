class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search, user_or_book)
  	if user_or_book == "1"
  		User.where(['name LIKE?', "%#{search}%"])
  	elsif user_or_book == "2"
      	Book.where(['title LIKE?', "%#{search}%"])
    else
      User.none
      Book.none
  	end
  end


end
