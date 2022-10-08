class User < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true

  VALID_STATUSES = %w[public private archived]
  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end

  # after_create :flush_cache
  # CACHE_KEY = 'USERS CACHED'

  # def flush_cache
  #   REDIS_CLIENT.del CACHE_KEY
  # end
end
