require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:user) {
        User.create(
            :name => "Mike",
            :password => "password",
            :email => "Mike@mike.com"
        )
    }

    let(:katuser){
        User.create(
            :name => "マイク",
            :password => "password",
            :email => "Mike@mike.com"
        )
    }

    let(:kanjiuser){
        User.create(
            :name => "舞う句",
            :password => "password",
            :email => "Mike@miike.com"
        )
    }

    let(:invaliduser1){
        User.create(
            :name => "マ",
            :password => "password",
            :email => "Mike@mike.com"
        )
    }

    let(:invaliduser2){
        User.create(
            :name => "!!!",
            :password => "password",
            :email => "Mike@Mike.com"
        )
    }

    it "is valid with a name, password, email" do
        expect(user).to be_valid
    end

    it "is valid with a a name in kanji, katakana, hiragana" do
       expect(katuser).to be_valid
       expect(kanjiuser).to be_valid
    end

    it "is invalid with a one letter name" do
       expect(invaliduser1).to be_invalid
    end

    it "is invalid with symbols in name" do
       expect(invaliduser2).to be_invalid
    end

    it "is invalid without an email" do
       expect(User.create(name: "name")).to be_invalid
    end

end
