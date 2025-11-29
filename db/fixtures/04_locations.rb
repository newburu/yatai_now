# db/fixtures/04_locations.rb

# Stall 1: 東山
Location.seed do |s|
  s.id = 1
  s.stall_id = 1
  s.latitude = 34.8041
  s.longitude = 134.7211
  s.timestamp = Time.zone.now
end

# Stall 2: 木場
Location.seed do |s|
  s.id = 2
  s.stall_id = 2
  s.latitude = 34.8005
  s.longitude = 134.7238
  s.timestamp = Time.zone.now
end

# Stall 3: 松原
Location.seed do |s|
  s.id = 3
  s.stall_id = 3
  s.latitude = 34.7938
  s.longitude = 134.7171
  s.timestamp = Time.zone.now
end

# Stall 4: 八家
Location.seed do |s|
  s.id = 4
  s.stall_id = 4
  s.latitude = 34.7909
  s.longitude = 134.7231
  s.timestamp = Time.zone.now
end

# Stall 5: 妻鹿
Location.seed do |s|
  s.id = 5
  s.stall_id = 5
  s.latitude = 34.7933
  s.longitude = 134.7082
  s.timestamp = Time.zone.now
end

# Stall 6: 宇佐崎
Location.seed do |s|
  s.id = 6
  s.stall_id = 6
  s.latitude = 34.7891
  s.longitude = 134.7118
  s.timestamp = Time.zone.now
end

# Stall 7: 中村
Location.seed do |s|
  s.id = 7
  s.stall_id = 7
  s.latitude = 34.7979
  s.longitude = 134.7151
  s.timestamp = Time.zone.now
end
