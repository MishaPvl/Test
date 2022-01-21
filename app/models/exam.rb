class Exam < ApplicationRecord
  validates :first_name, length: { maximum: 40 }, presence: true
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, length: { maximum: 40 }, presence: true
  validates :subject, presence: true
  validate :happened_at_is_valid_datetime


  def happened_at_is_valid_datetime
    errors.add(:Ошибка, 'введите дату формата YYYY-MM-DD') if ((DateTime.parse(date) rescue ArgumentError) == ArgumentError)
  end

  def full_name
    if middle_name.present?
      "#{last_name} #{first_name} #{middle_name}"
    else
      " #{last_name} #{first_name}"
    end
  end
end
