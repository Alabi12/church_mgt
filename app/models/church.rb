class Church < ApplicationRecord
    has_many :groups
    has_many :members
end
