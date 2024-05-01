class Member < ApplicationRecord
  belongs_to :user
  has_many :groups
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
end
