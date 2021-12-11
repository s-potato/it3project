class CreateFilmReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :film_reviews do |t|
      t.integer :user_id
      t.integer :film_id
      t.text :review
      t.integer :rate

      t.timestamps
    end
  end
end
