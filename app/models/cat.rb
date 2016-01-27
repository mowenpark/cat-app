class Cat < ActiveRecord::Base
  COLORS = %w(calico blue black)
  validates :birth_date, :color, :name, :sex, :description, presence: true
  before_save :set_age

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy


# Out of date
  def set_age
    self.age = Time.now.year - self.birth_date.year
  end
end
