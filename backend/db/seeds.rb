rentals = [
  {
    title: 'Grand Old Mansion',
    owner: 'Veruca Salt',
    city: 'San Francisco',
    type: 'Estate',
    bedrooms: 15,
    image: 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg'
  },

  {
    title: 'Urban Living',
    owner: 'Mike Teavee',
    city: 'Seattle',
    type: 'Condo',
    bedrooms: 1,
    image: 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Alfonso_13_Highrise_Tegucigalpa.jpg'
  },

  {
    title: 'Downtown Charm',
    owner: 'Violet Beauregarde',
    city: 'Portland',
    type: 'Apartment',
    bedrooms: 3,
    image: 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg'
  }
]

rentals.each do |params|
  Rental.find_or_create_by!(params)
end
