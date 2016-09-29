class Finder < ActiveRecord::Base
  require 'uri'
  belongs_to :user

  validates :name, :reference, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :reference, with: /\A(ftp|http|https)\:\/\/[a-z]+(\W)*([a-z])*[.]([a-z]+)(.*)[a-z]\z/, message: 'should match "https://www.myexample.com"'

  default_scope { order(created_at: :desc) }

  scope :name_like,        -> (value) { where('LOWER(finders.name) LIKE ?', "%#{value.downcase}%") }
  scope :reference_like,   -> (value) { where('LOWER(finders.reference) LIKE ?', "%#{value.downcase}%") }
  scope :description_like, -> (value) { where('LOWER(finders.description) LIKE ?', "%#{value.downcase}%") }

  private

  def author?
  	user_id == current_user.id	
  end
end
