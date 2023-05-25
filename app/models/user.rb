class User < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  # after_create :clear_cache

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }


  private
  def clear_cache
    Rails.cache.delete "users#index"
  end
end
