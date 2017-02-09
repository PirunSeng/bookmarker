class Finder < ActiveRecord::Base
  require 'uri'
  belongs_to :user

  PRIVACY = %w(Private Public)

  validates :name, :reference, presence: true, uniqueness: { case_sensitive: false }
  validates :privacy, presence: true
  validates_format_of :reference, with: /\A(ftp|http|https)\:\/\/[a-z]+(\W)*([a-z])*[.]([a-z]+)(.*)[a-z]\z/, message: 'should match "https://www.myexample.com"'

  default_scope { order(created_at: :desc) }

  scope :name_like,        -> (value) { where('LOWER(finders.name) LIKE ?', "%#{value.downcase}%") }
  scope :reference_like,   -> (value) { where('LOWER(finders.reference) LIKE ?', "%#{value.downcase}%") }
  scope :description_like, -> (value) { where('LOWER(finders.description) LIKE ?', "%#{value.downcase}%") }
  scope :public_access,    -> { where(privacy: PRIVACY[1]) }

  def self.accessible(user)
    if user.admin?
      all
    else
      where('privacy = ? or user_id = ?', PRIVACY[1], user.id)
    end
  end

  private

  def author?
  	user_id == current_user.id	
  end
end
