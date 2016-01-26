class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  before_save :set_age


  def set_age
    self.age = Time.now.year - self.birth_date.year
  end
end
