class Comment < ApplicationRecord
  include Visible
  belongs_to :user

  validates :commenter, presence: true
  validates :body, presence: true
  validates :status, inclusion: { in: VALID_STATUSES }

end
