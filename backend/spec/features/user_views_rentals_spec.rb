require "poltergeist"

feature "view rentals" do
  let(:rental) { create(:rental) }
  scenario "user sees rentals on the root path" do
    visit "/"
    expect(page).to have_content(rental.title)
    expect(page).to have_content(rental.city)
  end
end
