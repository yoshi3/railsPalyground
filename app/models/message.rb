class Message < ApplicationRecord
    include MessageSearchable

    belongs_to :person
    has_many :comment, dependent: :destroy
    mount_uploader :image, ImageUploader
    validates :message, presence: { message: 'を書いてください。' }
end
