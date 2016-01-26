class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}
  validate :overlapping_approved_requests

  belongs_to :cat,
    class_name: 'Cat',
    foreign_key: :cat_id,
    primary_key: :id

  def overlapping_requests
    CatRentalRequest.where(id: self.cat_id).each do |request|
      if self.start_date.between?(request.start_date, request.end_date) || self.end_date.between?(request.start_date, request.end_date)
        return true if request.status == 'APPROVED'
      end
    end

    false
  end

  private

  def overlapping_approved_requests
    if overlapping_requests
      errors.add(:overlapping, "is not permitted!")
    end
  end


end
