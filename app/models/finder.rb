class Finder < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :category, presence: true

  scope :rubyonrails, -> { where(category_id: 1).order(:name) }
  scope :jquery, -> { where(category_id: 2).order(:name) }

  private

  def author?
  	user_id == current_user.id	
  end
end
