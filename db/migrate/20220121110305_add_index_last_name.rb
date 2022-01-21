class AddIndexLastName < ActiveRecord::Migration[6.1]
  def change
    add_index :exams, :last_name
  end
end
