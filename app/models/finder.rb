class Finder < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  scope :rubyonrails, -> { where(category_id: 1).order('created_at DESC') }
  scope :jquery, -> { where(category_id: 2).order('created_at DESC') }
end
