class Main < ApplicationRecord
    validates :url, presence: { message: "必須入力です。" }
end
