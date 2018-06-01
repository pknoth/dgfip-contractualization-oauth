AccountType.where(name: 'service_provider').first_or_create
AccountType.where(name: 'dgfip').first_or_create
AccountType.where(name: 'cnaf').first_or_create
AccountType.where(name: 'api_particulier').first_or_create

AccountType.service_provider.update(
  scopes: %w[
    enrollments:write:user
    enrollments:read:user
  ]
)
AccountType.api_particulier.update(
  scopes: %w[
    enrollments:write:all
    enrollments:read:all
  ]
)
User.create(
  email: 'particulier@domain.user',
  password: 'password',
  account_type: AccountType.api_particulier,
  roles: ['domain']
)
User.create(
  email: 'entreprise@domain.user',
  password: 'password',
  account_type: AccountType.api_entreprise,
  roles: ['domain']
)
User.create(
  email: 'dgfip@domain.user',
  password: 'password',
  account_type: AccountType.dgfip,
  roles: ['domain']
)
app = Doorkeeper::Application.where(
  'name' => 'test',
  'uid' => '82546188522214c3577d35c283ce8842786649b35a026a9d44908037a597f29b',
  'secret' => '1ff180ba922fbbbb4cf6fe0d3e82efadaa48a14de454a2137e2d656aac5e97c4',
  'redirect_uri' => 'https://change.me',
  'scopes' => 'enrollments user'
).first_or_create
app.update_attribute(
  :redirect_uri, 'http://localhost:3000/oauth-callback'
)
