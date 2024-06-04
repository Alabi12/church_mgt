class Member < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :cs_members, class_name: "CsMember"
  has_and_belongs_to_many :generational_groups, class_name: "Generational"
  has_and_belongs_to_many :service_groups, class_name: "Service"

  enum group: { yaf: 'YAF', cs: 'CS', jy: 'JY', wf: 'W/F', ypg: 'YPG', mf: 'M/F', bb: 'BOYS_BRIGADE', gb: 'GIRLS_BRIGADE'}, _suffix: true
  # enum group2: { choir: 'CHURCU_CHOIR', bb: 'BOYS_BRIGADE', gb: 'GIRLS_BRIGADE', vor: 'VOR', bspg: 'BSPG'}, _suffix: true
  
  has_many :posts, dependent: :destroy
  # has_many :posts
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
