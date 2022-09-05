class User < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true
    validates :mobile, presence: true
end
