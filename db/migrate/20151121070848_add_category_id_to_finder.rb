class AddCategoryIdToFinder < ActiveRecord::Migration
  def change
    add_reference :finders, :category, index: true, foreign_key: true
  end
end
