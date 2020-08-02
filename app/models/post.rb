class Post < ApplicationRecord
    validates :title, presence: true,
    length: {minimum:2}
    validates :category, presence: true  
    validates :body, presence: true
    
    has_many :comments
    belongs_to :user
end
