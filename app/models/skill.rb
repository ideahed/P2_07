class Skill < ActiveRecord::Base
  # Remember to create a migration!
  has_many :ratings
  has_many :users, through: :ratings
  validates :name, uniqueness: true
  validates :context, uniqueness: true
  validates :name, :context, presence: true

  def user_with_proficiency(proficiency)
    user_id = self.ratings.find_by_proficiency(proficiency).user_id
    User.find(user_id)
  end
end
