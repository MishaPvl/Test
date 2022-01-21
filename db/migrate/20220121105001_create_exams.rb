class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :subject
      t.datetime :date

      t.timestamps
    end
  end
end
