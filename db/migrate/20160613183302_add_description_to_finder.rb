class AddDescriptionToFinder < ActiveRecord::Migration
  def change
    add_column :finders, :description, :text, default: ''
  end
end
