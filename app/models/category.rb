class Category < ActiveRecord::Base
  has_many :finders
  belongs_to :user
end
