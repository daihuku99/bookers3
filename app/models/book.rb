class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {maximum: 200 }
	validates :body, presence: true, length: {maximum: 200 }

	def favorited_by?(user)
    	favorites.where(user_id: user_id).exists?
  	end

end
