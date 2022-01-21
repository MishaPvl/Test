class Exam < ApplicationRecord
  validates :first_name, length: { in: 3..20 }, presence: true
  validates :middle_name, length: { in: 0..20 }
  validates :last_name, length: { in: 3..20 }, presence: true
  validates :subject, presence: true
  validates :date, timeliness: { on_or_after: lambda { Date.current }, type: :date }




  def full_name
    if middle_name.present?
      "#{last_name} #{first_name} #{middle_name}"
    else
      " #{last_name} #{first_name}"
    end
  end
end
