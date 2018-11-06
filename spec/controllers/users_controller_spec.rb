require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	render_views

	context "Get index" do
		it 'return a success response and have register and connect link ' do 
			get :index
			expect(response).to be_successful
			expect(response.body).to have_link('Enregistre-toi !')
			expect(response.body).to have_link('Connecte-toi !')
		end

		it 'return a success response and have club and disconnect link' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :index
			expect(response).to be_successful
			expect(response.body).to have_link('Le club secret :)')
			expect(response.body).to have_link('Déconnexion')
			expect(response.body).to have_link('Mise à jour')
		end
	end

	context "Get navbar" do
		it 'return the good links when not connected' do
			get :index
			expect(response.body).to have_link('Enregistrement')
			expect(response.body).to have_link('Connexion')
		end

		it 'return the good links when connected' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :index
			expect(response.body).to have_link('Le club :)')
			expect(response.body).to have_link('MaJ des données')
		end
	end

	context "Get club" do
		it 'return a redirect if not connected' do
			get :fight_club
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/users'
		end

		it 'return a success if connected'  do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :fight_club
			expect(response).to be_successful
		end	
		it 'check presences of users' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			user2 = User.create!(first_name: 'loro', last_name: 'Loto', email: 'toto2@mail.com', password: "01234")
			login(user)
			get :fight_club
			expect(response).to be_successful
			expect(response.body).to include user.first_name
			expect(response.body).to include user.last_name
			expect(response.body).to include user.email
			expect(response.body).to include user2.first_name
			expect(response.body).to include user2.last_name
			expect(response.body).to include user2.email
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
			expect(response).to be_successful
		end
		
		it 'succeed and has user spec if connected with right user' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :show, params: {id: user.to_param}
			expect(response).to be_successful
			expect(response.body).to include user.first_name
			expect(response.body).to include user.last_name
			expect(response.body).to include user.email
		end
		
	end
	
	context "Get edit" do

		it 'succeed if connected as right user' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			get :edit, params: {id: user.to_param}
			expect(response).to be_successful
		end
	
		it 'redirect if deconnected' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			get :edit, params: {id: user.to_param}
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/users'
		end

		it 'redirect if not connected to right user' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			user2 = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto2@mail.com', password: "01234")
			login(user)	
			get :edit, params: {id: user2.to_param}
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to '/club'
		end
	end

	context 'Post edit' do
		
		it 'redirect if empty field' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			patch :update, params: {id: user.to_param, "user"=> { "first_name" => "     ", last_name: 'Toto', email: 'toto@mail.com' }}
			expect(flash[:notice]).to be_present
	  		expect(response).to redirect_to '/users/' +  user.id.to_s + '/edit'
		end

		it 'redirect if same email' do
			user2 = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto2@mail.com', password: "01234")
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			patch :update, params: {id: user.to_param, "user"=> { "first_name" => "toto", last_name: 'Toto', email: 'toto2@mail.com' }}
			expect(flash[:notice]).to be_present
	  	expect(response).to redirect_to '/users/' +  user.id.to_s + '/edit'
		end
		
		it 'redirect successfull' do
			user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
			login(user)
			patch :update, params: {id: user.to_param, "user"=> { "first_name" => "toto", last_name: 'Toto', email: 'toto2@mail.com' }}
			expect(flash[:notice]).to be_present
	  	expect(response).to redirect_to '/club'
		end

	end
end
	


