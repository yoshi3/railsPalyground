class Person < ApplicationRecord
    has_many :message
    has_many :comment

    validates :name, presence: { message: 'は、必須項目です。' }
    validates :age, numericality: { message: 'は、数字で入力してください。' }
    validates :mail, email: { message:  'はメールアドレスではありません。' }
end
