class Finder < ActiveRecord::Base
  belongs_to :user

  validates :name, :reference, presence: true, uniqueness: { case_sensitive: false }

  scope :search, -> (value) { where('name LIKE ? OR reference LIKE ? OR description LIKE ?', "%#{value}%", "%#{value}%", "%#{value}%") }

  private

  def author?
  	user_id == current_user.id	
  end
end
