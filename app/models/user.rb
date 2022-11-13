class User < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }

end
