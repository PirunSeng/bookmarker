class Finder < ActiveRecord::Base
  belongs_to :user

  validates :name, :reference, presence: true, uniqueness: { case_sensitive: false }

  private

  def author?
  	user_id == current_user.id	
  end
end
