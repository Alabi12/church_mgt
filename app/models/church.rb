class Church < ApplicationRecord
    self.table_name = "churches"
    has_many :groups
    has_many :members

    validates :name, presence: true
    validates :location, presence: true
end
