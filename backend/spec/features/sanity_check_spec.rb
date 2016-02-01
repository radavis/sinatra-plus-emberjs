require "spec_helper"

feature "sanity check", js: true do
  scenario "user visits root path" do
    visit "/"
    expect(page.title).to eq("Sinatra+Ember")
  end
end
