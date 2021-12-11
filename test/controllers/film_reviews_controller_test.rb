require "test_helper"

class FilmReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film_review = film_reviews(:one)
  end

  test "should get index" do
    get film_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_film_review_url
    assert_response :success
  end

  test "should create film_review" do
    assert_difference('FilmReview.count') do
      post film_reviews_url, params: { film_review: { film_id: @film_review.film_id, rate: @film_review.rate, review: @film_review.review, user_id: @film_review.user_id } }
    end

    assert_redirected_to film_review_url(FilmReview.last)
  end

  test "should show film_review" do
    get film_review_url(@film_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_film_review_url(@film_review)
    assert_response :success
  end

  test "should update film_review" do
    patch film_review_url(@film_review), params: { film_review: { film_id: @film_review.film_id, rate: @film_review.rate, review: @film_review.review, user_id: @film_review.user_id } }
    assert_redirected_to film_review_url(@film_review)
  end

  test "should destroy film_review" do
    assert_difference('FilmReview.count', -1) do
      delete film_review_url(@film_review)
    end

    assert_redirected_to film_reviews_url
  end
end
