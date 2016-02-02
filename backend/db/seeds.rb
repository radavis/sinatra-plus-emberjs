rentals = [
  {
    title: 'Grand Old Mansion',
    owner: 'Veruca Salt',
    city: 'San Francisco',
    category: 'Estate',
    bedrooms: 15,
    image: 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg'
  },

  {
    title: 'Urban Living',
    owner: 'Mike Teavee',
    city: 'Seattle',
    category: 'Condo',
    bedrooms: 1,
    image: 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Alfonso_13_Highrise_Tegucigalpa.jpg'
  },

  {
    title: 'Downtown Charm',
    owner: 'Violet Beauregarde',
    city: 'Portland',
    category: 'Apartment',
    bedrooms: 3,
    image: 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg'
  }
]

rentals.each do |params|
  rental = Rental.find_or_initialize_by(title: params[:title])
  rental.update_attributes!(params)
end
