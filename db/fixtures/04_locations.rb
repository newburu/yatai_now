# db/fixtures/04_locations.rb

# Stall 1: 東山
Location.seed do |s|
  s.id = 1
  s.stall_id = 1
  s.latitude = 34.7958
  s.longitude = 134.7215
  s.timestamp = Time.zone.now
end

# Stall 2: 木場
Location.seed do |s|
  s.id = 2
  s.stall_id = 2
  s.latitude = 34.7945
  s.longitude = 134.7201
  s.timestamp = Time.zone.now
end

# Stall 3: 松原
Location.seed do |s|
  s.id = 3
  s.stall_id = 3
  s.latitude = 34.7932
  s.longitude = 134.7187
  s.timestamp = Time.zone.now
end

# Stall 4: 八家
Location.seed do |s|
  s.id = 4
  s.stall_id = 4
  s.latitude = 34.7920
  s.longitude = 134.7173
  s.timestamp = Time.zone.now
end

# Stall 5: 妻鹿
Location.seed do |s|
  s.id = 5
  s.stall_id = 5
  s.latitude = 34.7908
  s.longitude = 134.7159
  s.timestamp = Time.zone.now
end

# Stall 6: 宇佐崎
Location.seed do |s|
  s.id = 6
  s.stall_id = 6
  s.latitude = 34.7896
  s.longitude = 134.7145
  s.timestamp = Time.zone.now
end

# Stall 7: 中村
Location.seed do |s|
  s.id = 7
  s.stall_id = 7
  s.latitude = 34.7884
  s.longitude = 134.7131
  s.timestamp = Time.zone.now
end
