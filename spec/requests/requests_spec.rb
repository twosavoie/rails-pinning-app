require "spec_helper"

RSpec.describe "Our Application Routes" do

  # When you submit a get request to /pins/name-:slug...
  describe "GET /pins/name-:slug" do
    # you should receive the pins/show template...
    it 'renders the pins/show template' do
      # to test, I'll set the first pin in my db to the variable "pin"...
      pin = Pin.first
      # I will then ask rspec to fake a get request to /pins/name-slug of the first pin in my db...
      get "/pins/name-#{pin.slug}"
      # I expect that request will result in the pins/show template being produced
      expect(response).to render_template("pins/show")
    end

    # Not only do I want the template to be produced, I want it to be for the appropriate pin...
    it 'populates the @pin variable with the appropriate pin' do
      # So once again, I'll set the first pin in my db to the variable "pin"...
      pin = Pin.first
      # I will then ask rspec to fake a get request to /pins/name-slug of the first pin in my db...
      get "/pins/name-#{pin.slug}"
      # I expect that the pin variable produced will be the same as my first pin in my db whose slug was used in out get request.
      expect(assigns[:pin]).to eq(Pin.first)
    end
  end

end
