# db/fixtures/users.rb
User.seed do |s|
  s.id = 1
  s.email = "admin@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :admin
end

User.seed do |s|
  s.id = 2
  s.email = "manager1@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 4
  s.email = "manager3@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 5
  s.email = "manager4@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 6
  s.email = "manager5@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 7
  s.email = "manager6@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 8
  s.email = "manager7@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end

User.seed do |s|
  s.id = 3
  s.email = "manager2@example.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.role = :manager
end
