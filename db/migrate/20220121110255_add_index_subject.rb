class AddIndexSubject < ActiveRecord::Migration[6.1]
  def change
    add_index :exams, :subject
  end
end
