class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :ratings
  has_many :skills, through: :ratings
  validates :name, :email, presence: true

  def proficiency_for(skill)
    self.ratings.find_by_skill_id(skill.id).proficiency
  end

  def set_proficiency_for(skill, rating)
    skill = self.ratings.find_by_skill_id(skill.id)
    skill.proficiency = rating
    skill.save
  end

  

end
