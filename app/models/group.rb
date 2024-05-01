class Group < ApplicationRecord
    belongs_to :church
    has_many :members
end
