require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "creating an account" do
    visit new_user_path

    fill_in :user_email, with: "example@mail.com"
    fill_in :user_name, with: "ivanov"
    fill_in :user_password, with: "qwerty"
    fill_in :user_password_confirmation, with: "qwerty"

    click_button "Зарегестрироваться"

    assert_selector "h1", text: "Экзамены"
  end
end
