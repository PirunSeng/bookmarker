class Finder < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  scope :rubyonrails, -> { where(category_id: 1).order(:name) }
  scope :jquery, -> { where(category_id: 2).order(:name) }
end
