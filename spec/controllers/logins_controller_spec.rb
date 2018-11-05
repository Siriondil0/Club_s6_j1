require 'rails_helper'

RSpec.describe LoginsController, type: :controller do

  context "GET #index" do
    it 'returns a success response' do 
	    get :index
	    expect(response).to be_successful
	  end
  end

  context "POST #create" do
    it 'returns a success response' do
      user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
      post :create , params: {"user"=> { "email"=>'toto@mail.com',"password"=> "01234" }}
      expect(response).to redirect_to '/club'
      expect(flash[:notice]).to be_present
    end

    it 'returns an error due to invalid password' do
      user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
      post :create , params: {"user"=> { "email"=>'toto@mail.com',"password"=> "abcdef" }}
      expect(response).to redirect_to '/logins'
      expect(flash[:notice]).to be_present
    end

    it 'returns an error due to wrong email' do
      user = User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
      post :create , params: {"user"=> { "email"=>'tata',"password"=> "01234" }}
      expect(response).to redirect_to '/logins'
      expect(flash[:notice]).to be_present
    end
  end
end
