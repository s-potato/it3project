class FilmsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_film, only: %i[ show edit update destroy ]
  
  # GET /films or /films.json
  def index
    @films = if params[:term]
      Film.where('title LIKE ?', "%#{params[:term]}%")
    else
      @films = Film.all
    end
  end

  # GET /films/1 or /films/1.json
  def show
    @film_review = FilmReview.new
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films or /films.json
  def create
    @film = Film.new(film_params)
    @film.rate = 0

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: "Film was successfully created." }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1 or /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: "Film was successfully updated." }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    @film.film_review.each do |film_review|
        film_review.destroy
    end
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: "Film was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_params
      params.require(:film).permit(:title, :description, :genre, :episode, :thumbnail, :trailer)
    end
end
