class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.integer :episode
      t.float :rate

      t.timestamps
    end
  end
end
