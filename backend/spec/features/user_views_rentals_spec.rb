require "poltergeist"

feature "view rentals" do
  let(:rentals) { create_list(:rental, 3) }

  scenario "user sees rentals on the root path" do
    visit "/"

    rentals.each do |rental|
      expect(page).to have_content(rental.title)
      expect(page).to have_content(rental.city)
    end
  end
end
