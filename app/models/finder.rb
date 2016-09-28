class Finder < ActiveRecord::Base
  belongs_to :user

  validates :name, :reference, presence: true, uniqueness: { case_sensitive: false }

  scope :name_like,        -> (value) { where('LOWER(finders.name) LIKE ?', "%#{value.downcase}%") }
  scope :reference_like,   -> (value) { where('LOWER(finders.reference) LIKE ?', "%#{value.downcase}%") }
  scope :description_like, -> (value) { where('LOWER(finders.description) LIKE ?', "%#{value.downcase}%") }

  private

  def author?
  	user_id == current_user.id	
  end
end
