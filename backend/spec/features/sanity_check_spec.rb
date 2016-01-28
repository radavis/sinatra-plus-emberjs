require "poltergeist"

feature "sanity check" do
  scenario "user visits root path" do
    visit "/"
    expect(page.title).to eq("Sinatra+Ember")
  end
end
