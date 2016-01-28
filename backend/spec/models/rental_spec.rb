require "spec_helper"

RSpec.describe Rental do
  context "valid rental" do
    let(:rental) { Rental.new(title: "South End Flat", city: "Boston", bedrooms: 2) }

    it "is valid when title, city and, bedrooms are present" do
      expect(rental).to be_valid
    end
  end

  context "invalid rental" do
    let(:rental) { Rental.new(title: "", city: "", bedrooms: "") }

    it "is not valid when author and text are absent" do
      expect(rental).to_not be_valid
    end
  end
end
