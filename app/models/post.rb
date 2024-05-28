class Post < ApplicationRecord
    belongs_to :member

    validates :title, presence: true
    validates :description, presence: true
end
