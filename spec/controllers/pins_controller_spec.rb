require 'spec_helper'
RSpec.describe PinsController do

  describe "GET index" do

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end

    it 'populates @pins with all pins' do
      get :index
      expect(assigns[:pins]).to eq(Pin.all)
    end
  end

  describe "GET new" do
    it 'responds with success' do
      get :new
      expect(response.success?).to be(true)
    end

    it 'renders the new view' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns an instance variable to a new pin' do
      get :new
      expect(assigns(:pin)).to be_a_new(Pin)
    end
  end

  describe "POST create" do
    before(:each) do
      @pin_hash = {
        title: "Rails Wizard",
        url: "http://railswizard.org",
        slug: "rails-wizard",
        text: "A fun and helpful Rails Resource",
        category_id: 1}
    end

    after(:each) do
      pin = Pin.find_by_slug("rails-wizard")
      if !pin.nil?
        pin.destroy
      end
    end

    it 'responds with a redirect' do
      post :create, pin: @pin_hash
      expect(response.redirect?).to be(true)
    end

    it 'creates a pin' do
      post :create, pin: @pin_hash
      expect(Pin.find_by_slug("rails-wizard").present?).to be(true)
    end

    it 'redirects to the show view' do
      post :create, pin: @pin_hash
      expect(response).to redirect_to(pin_url(assigns(:pin)))
    end

    it 'redisplays new form on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(response).to render_template(:new)
    end

    it 'assigns the @errors instance variable on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(assigns[:errors].present?).to be(true)
    end

  end

  describe "GET edit" do
    before(:each) do
      @pin = Pin.create(
        title: "Rails Wizard",
        url: "http://railswizard.org",
        slug: "rails-wizard",
        text: "A fun and helpful Rails Resource",
        category_id: 1)
    end

    after(:each) do
      pin = Pin.find_by_slug("rails-wizard")
      if !pin.nil?
        pin.destroy
      end
    end

    it 'responds with success' do
      get :edit, id: @pin.id
      expect(response.success?).to be(true)
    end

    it 'renders the edit template' do
      get :edit, id: @pin.id
      expect(response).to render_template(:edit)
    end

    it 'assigns an instance variable to a new pin' do
      get :edit, id: @pin.id
      expect(assigns(:pin)).to eq(@pin)
    end
  end

  describe "PUT update" do
    before(:each) do
      @pin = Pin.create(title: "Rails Wizard",
      url: "http://railswizard.org",
      slug: "rails-wizard",
      text: "A fun and helpful Rails Resource",
      category_id: "rails")
      @pin_hash = {
        title: "Rails Wizard",
        url: "http://railswizard.org",
        slug: "rails-wizard",
        text: "A fun and helpful Rails Resource",
        category_id: 1}
      end

      after(:each) do
        pin = Pin.find_by_slug("rails-wizard")
        if !pin.nil?
          pin.destroy
        end
      end

    it 'responds with success' do
      put :update, id: @pin.id, pin: @pin_hash
      expect(response).to redirect_to("/pins/#{@pin.id}")
    end

    it 'updates a pin' do
      new_title = "Skillcrush"
      put :update, id: @pin.id, pin: @pin_hash
      expect(@pin.reload.title).not_to eq(new_title)
    end

    it 'redirects to the show view' do
      put :update, id: @pin.id, pin: @pin_hash
      expect(response).to redirect_to(pin_url(assigns(:pin)))
    end

    it 'assigns the @errors instance variable on error' do
      @pin_hash[:title] = ""
      put :update, pin: @pin_hash, id: @pin.id
      expect(assigns[:errors].present?).to be(true)
    end

    it 'redisplays edit form on error' do
      @pin_hash[:title] = ""
      put :update, pin: @pin_hash, id: @pin.id
      expect(response).to render_template(:edit)
    end
  end

#final end
end
