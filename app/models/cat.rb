class Cat < ActiveRecord::Base
  COLORS = %w(calico blue black)
  validates :birth_date, :color, :name, :sex, :description, presence: true

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy


  def age
    Time.now.year - self.birth_date.year
  end
  
end
