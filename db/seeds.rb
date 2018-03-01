AccountType.where(name: 'service_provider').first_or_create
AccountType.where(name: 'dgfip').first_or_create
User.create(
  email: 'test@domain.user',
  password: 'password',
  account_type: AccountType.dgfip,
  roles: ['domain']
)
User.create(
  email: 'test@security.user',
  password: 'password',
  account_type: AccountType.dgfip,
  roles: ['security']
)
app = Doorkeeper::Application.create(
  'name' => 'test',
  'uid' => '82546188522214c3577d35c283ce8842786649b35a026a9d44908037a597f29b',
  'secret' => '1ff180ba922fbbbb4cf6fe0d3e82efadaa48a14de454a2137e2d656aac5e97c4',
  'redirect_uri' => 'https://change.me',
  'scopes' => 'enrollments user'
)
app.update_attribute(
  :redirect_uri, 'http://localhost:3000/users/auth/resource_provider/callback'
)
