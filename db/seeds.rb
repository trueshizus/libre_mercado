user_1 = User.create( password: '123123123', password_confirmation: '123123123', email: 'ejemplo@gmail.com', telephone: '4444-5555', places: 'Belgrano', first_name: 'Jose', last_name: 'Lopez', address: 'Virrey del pino 210')

user_2 = User.create( password: '123123123', password_confirmation: '123123123', email: 'fotografo@gmail.com', telephone: '4444-5556', places: 'Belgrano', first_name: 'Teo fotografo', last_name: 'Gutierrez', address: 'Virrey del pino 211')

user_3 = User.create( password: '123123123', password_confirmation: '123123123', email: 'fotografo2@gmail.com', telephone: '4444-5557', places: 'Palermo', first_name: 'Rodrigo fotografo', last_name: 'Mora', address: 'Guemes 4700')

user_4 = User.create( password: '123123123', password_confirmation: '123123123', email: 'catering@gmail.com', telephone: '4444-5558', places: 'Puerto Madero', first_name: 'Camila catering', last_name: 'Gonzalez', address: 'Eduardo Madero 232')

user_5 = User.create( password: '123123123', password_confirmation: '123123123', email: 'show@gmail.com', telephone: '4444-5559', places: 'Belgrano', first_name: 'Juan show', last_name: 'Fernandez', address: 'Virrey del pino 213')

listing_1 = Listing.create(title: 'Fotografo', description: 'Fotografo para casamiento', user: user_1) 
listing_2 = Listing.create(title: 'Catering', description: 'Catering para 150 personas', user: user_1)
listing_3 = Listing.create(title: 'Show', description: 'Show para casamiento', user: user_1)

Offer.create(description: 'Fotografo todo incluido, 150 fotos reveladas + album + book + gigantografia', price: 2000.0, user: user_2, listing: listing_1)

Offer.create(description: 'Fotografo + 500 fotos reveladas + album + book + gigantografia', price: 1900.0, user: user_3, listing: listing_1)

Offer.create(description: 'Catering para 200 personas', price: 40000.0, user: user_4, listing: listing_2)