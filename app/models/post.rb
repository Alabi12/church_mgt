class Post < ApplicationRecord
    belongs_to :member

    validates :title, :description, presence: true
end
