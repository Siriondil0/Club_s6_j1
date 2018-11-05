require 'rails_helper'

RSpec.describe User, type: :model do
  context 'verification user' do
    it "verify if first_name" do
      user = User.new(last_name: 'Toto', email: 'toto@mail.com', password: "01234").save
      expect(user).to eq(false)
    end

    it "verify if first_name blank" do
      user = User.new(first_name:'      ', last_name: 'Toto', email: 'toto@mail.com', password: "01234").save
      expect(user).to eq(false)
    end

    it "verify if last_name" do
      user = User.new(first_name: 'Toto', email: 'toto@mail.com', password: "01234").save
      expect(user).to eq(false)
    end

    it "verify if email" do
      user = User.new(last_name: 'Toto', first_name: 'toto', password: "01234").save
      expect(user).to eq(false)
    end
    
    it "verify if password" do
      user = User.new(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com').save
      expect(user).to eq(false)
    end

    it "verify if save succesfull" do
      user = User.new(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234").save
      expect(user).to eq(true)
    end

    it "verify if email unique" do
      User.create!(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234")
      user = User.new(first_name: 'toto', last_name: 'Toto', email: 'toto@mail.com', password: "01234").save
      expect(user).to eq(false)
    end
  end


end
 