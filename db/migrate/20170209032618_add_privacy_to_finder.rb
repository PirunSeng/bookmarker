class AddPrivacyToFinder < ActiveRecord::Migration
  def change
    add_column :finders, :privacy, :string, default: 'Public'
  end
end
