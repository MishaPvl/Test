class Exam < ApplicationRecord
  validates :first_name, length: { maximum: 40 }, presence: true
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, length: { maximum: 40 }, presence: true
  validates :subject, presence: true



  def full_name
    if middle_name.present?
      "#{last_name} #{first_name} #{middle_name}"
    else
      " #{last_name} #{first_name}"
    end
  end
end
