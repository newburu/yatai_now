# app/models/festival.rb
class Festival < ApplicationRecord
  # この祭りはたくさんの屋台(stalls)を持っている
  has_many :stalls
end
