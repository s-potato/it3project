class FilmReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_film_review, only: %i[ show edit update destroy ]

  # GET /film_reviews or /film_reviews.json
  def index
    @film_reviews = FilmReview.all
  end

  # GET /film_reviews/1 or /film_reviews/1.json
  def show
  end

  # GET /film_reviews/new
  def new
    @film_review = FilmReview.new
  end

  # GET /film_reviews/1/edit
  def edit
  end

  # POST /film_reviews or /film_reviews.json
  def create
    @film_review = FilmReview.new(film_review_params)
    @film_review.user_id = current_user.id

    respond_to do |format|
      if @film_review.save
        if @film_review.film
          rate_count = 0
          rate_sum = 0
          @film_review.film.film_review.each do |film_review|
            puts film_review.rate
            if film_review.rate
              rate_count += 1
              rate_sum += film_review.rate
            end
          end
          if rate_count > 0
            @film_review.film.rate = rate_sum.to_f/rate_count
          else
            @film_review.film.rate = 0
          end
          @film_review.film.save
        end
        url = "/films/" + @film_review.film_id.to_s
        format.html { redirect_to url, notice: 'Film review was successfully created.' }
        format.json { render :show, status: :created, location: @film_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /film_reviews/1 or /film_reviews/1.json
  def update
    respond_to do |format|
      if @film_review.update(film_review_params)
        if @film_review.film
          rate_count = 0
          rate_sum = 0
          @film_review.film.film_review.each do |film_review|
            puts film_review.rate
            if film_review.rate
              rate_count += 1
              rate_sum += film_review.rate
            end
          end
          if rate_count > 0
            @film_review.film.rate = rate_sum.to_f/rate_count
          else
            @film_review.film.rate = 0
          end
          @film_review.film.save
        end
        format.html { redirect_to @film_review, notice: "Film review was successfully updated." }
        format.json { render :show, status: :ok, location: @film_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_reviews/1 or /film_reviews/1.json
  def destroy
    @film_review.destroy
    respond_to do |format|
      format.html { redirect_to film_reviews_url, notice: "Film review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film_review
      @film_review = FilmReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_review_params
      params.require(:film_review).permit(:user_id, :film_id, :review, :rate)
    end
end
