User.create! first_name: 'Jordi', last_name: 'Martí', email: 'jordimarti@me.com', password: 'piruleta', password_confirmation: 'piruleta'
User.create! first_name: 'Hoitimaili', last_name: 'Martí', email: 'jmartimunoz@hotmail.com', password: 'piruleta', password_confirmation: 'piruleta'
User.create! first_name: 'Gmailini', last_name: 'Martini', email: 'jordimarti007@gmail.com', password: 'piruleta', password_confirmation: 'piruleta'
Account.create! name: 'Martinelli'
Account.create! name: 'HoitiAccount'
AccountAffiliation.create! user_id: 1, account_id: 4, role: 'admin'
AccountAffiliation.create! user_id: 2, account_id: 5, role: 'viewer'
Channel.create! account_id: 4, name: 'Martinelli live', privacy: 'public', publicid: SecureRandom.base58(10)
Channel.create! account_id: 4, name: 'Martinelli team space', privacy: 'private', publicid: SecureRandom.base58(10)
Channel.create! account_id: 5, name: 'Hoiti world', privacy: 'public', publicid: SecureRandom.base58(10)
