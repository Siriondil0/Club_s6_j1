require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  
  context "GET #index" do
    it 'returns a success response' do 
	  get :index
	  expect(response).to be_successful
	end
  end

  context "POST #create" do
    it 'creates user with existing email' do
      user = User.create!(first_name: 'First', last_name: 'Last', email: 'first.last@example.com', password: 'AZERTY12345')
      post :create, params: { "user"=> { "first_name" => "First", "last_name" => "Last", "email" => "first.last@example.com", "password" => "AZERTY12345"} }
      expect(response).to redirect_to '/registrations'
    end

    it 'creates user with empty field' do
      post :create, params: { "user"=> { "first_name" => "    ", "last_name" => "Last", "email" => "first.last@example.com", "password" => "AZERTY12345"} }
      expect(response).to redirect_to '/registrations'
    end
  end

end