require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	render_views

	context "Get index" do
		
		it 'return a success response and have register and connect link ' do 
			get :index
			expect(response).to be_success
			expect(response.body).to have_link('Enregistre-toi !')
			expect(response.body).to have_link('Connecte-toi !')
		end

		it 'return a success response and have club and disconnect link' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :index
			expect(response).to be_success
			expect(response.body).to have_link('Le club secret :)')
			expect(response.body).to have_link('Déconnexion')
		end
	end

	context "Get club" do
		render_views false

		it 'return a redirect if not connected' do
			get :fight_club
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/users'
		end

		it 'return a success if connected'  do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :fight_club
			expect(response).to be_success
		end	
	end

	context "Get show" do

		it 'redirect if not connected' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			get :show, params: {id: user.to_param}
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/users'
		end

		it 'redirect if not connected with right user' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			user2 = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto2@mail.com', password: "01234")
			login(user)
			get :show, params: {id: user2.to_param}
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/users'
		end
		
		it 'succeed and has user spec if connected with right user' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :show, params: {id: user.to_param}
			expect(response).to be_success
			expect(response.body).to include user.first_name
			expect(response.body).to include user.last_name
			expect(response.body).to include user.email
		end
	end

	context "Get edit" do


end
	


