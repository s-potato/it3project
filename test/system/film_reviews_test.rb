require "application_system_test_case"

class FilmReviewsTest < ApplicationSystemTestCase
  setup do
    @film_review = film_reviews(:one)
  end

  test "visiting the index" do
    visit film_reviews_url
    assert_selector "h1", text: "Film Reviews"
  end

  test "creating a Film review" do
    visit film_reviews_url
    click_on "New Film Review"

    fill_in "Film", with: @film_review.film_id
    fill_in "Rate", with: @film_review.rate
    fill_in "Review", with: @film_review.review
    fill_in "User", with: @film_review.user_id
    click_on "Create Film review"

    assert_text "Film review was successfully created"
    click_on "Back"
  end

  test "updating a Film review" do
    visit film_reviews_url
    click_on "Edit", match: :first

    fill_in "Film", with: @film_review.film_id
    fill_in "Rate", with: @film_review.rate
    fill_in "Review", with: @film_review.review
    fill_in "User", with: @film_review.user_id
    click_on "Update Film review"

    assert_text "Film review was successfully updated"
    click_on "Back"
  end

  test "destroying a Film review" do
    visit film_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Film review was successfully destroyed"
  end
end
