class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true,
    length: {minimum:2}
    validates :category, presence: true  
    validates :body, presence: true

    belongs_to :user
end
