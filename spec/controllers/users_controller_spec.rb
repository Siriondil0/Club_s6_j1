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

	context "Get show" do
		it 'return a success response and display name' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			get :show, params: {id: user.to_param}
			expect(response).to be_success
			expect(response.body).to include user.first_name
		end

		
		it 'has user first_name' do
		end

		it 'has user first_name' do
		end
	end
end
	


