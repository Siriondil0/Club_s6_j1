require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	context "Get index" do
		it 'return a success response' do 
			get :index
			expect(response).to be_success
		end
	end

	context "Get club" do
		it 'return a success response' do
			get :fight_club
			expect(response).to redirect_to '/users'
		end
	end
	
	

end
