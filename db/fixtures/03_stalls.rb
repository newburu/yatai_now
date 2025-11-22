# db/fixtures/03_stalls.rb
Stall.seed do |s|
  s.id = 1
  s.name = "東山"
  s.description = "東山地区の屋台"
  s.festival_id = 1
  s.user_id = 2 # manager1
end

Stall.seed do |s|
  s.id = 2
  s.name = "木場"
  s.description = "木場地区の屋台"
  s.festival_id = 1
  s.user_id = 3 # manager2
end

Stall.seed do |s|
  s.id = 3
  s.name = "松原"
  s.description = "松原地区の屋台"
  s.festival_id = 1
  s.user_id = 4 # manager3
end

Stall.seed do |s|
  s.id = 4
  s.name = "八家"
  s.description = "八家地区の屋台"
  s.festival_id = 1
  s.user_id = 5 # manager4
end

Stall.seed do |s|
  s.id = 5
  s.name = "妻鹿"
  s.description = "妻鹿地区の屋台"
  s.festival_id = 1
  s.user_id = 6 # manager5
end

Stall.seed do |s|
  s.id = 6
  s.name = "宇佐崎"
  s.description = "宇佐崎地区の屋台"
  s.festival_id = 1
  s.user_id = 7 # manager6
end

Stall.seed do |s|
  s.id = 7
  s.name = "中村"
  s.description = "中村地区の屋台"
  s.festival_id = 1
  s.user_id = 8 # manager7
end
