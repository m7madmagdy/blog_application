class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true

  # after_create :flush_cache
  # CACHE_KEY = 'USERS CACHED'

  # def flush_cache
  #   REDIS_CLIENT.del CACHE_KEY
  # end
end
