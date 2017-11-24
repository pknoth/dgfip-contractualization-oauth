resource_provider = ResourceProvider.where(name: 'dgfip').first_or_create
User.create(
  email: 'test@user.user',
  password: 'password',
  resource_provider: resource_provider
)
