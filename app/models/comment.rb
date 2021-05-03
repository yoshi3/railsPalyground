class Comment < ApplicationRecord
    belongs_to :person
    belongs_to :message

    validates :comment, presence: { message: 'を書いてください。' }
end
