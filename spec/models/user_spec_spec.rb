require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
 
    it "returns successfully when given all input values" do
      @user = User.create(name: 'John', last_name: "Man", email: 'johnman@gmail.com', password: '12345', password_confirmation:'12345' )
      expect(@user).to be_valid
    end
  

  
    it "throws error when no first name inputted" do
      @user = User.create(name: nil, last_name: "Man", email: 'johnman@gmail.com', password: '12345', password_confirmation:'12345' )
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
 

 
    it "throws error when no last name inputted" do
      @user = User.create(name: "John", last_name: nil, email: 'johnman@gmail.com', password: '12345', password_confirmation:'12345' )
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
 

  
    it "throws error when no email inputted" do
      @user = User.create(name: "John", last_name: 'Joe', email: nil, password: '12345', password_confirmation:'12345' )
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end


 
    it "throws error when given incorrect password confirmation" do
      @user = User.create(name: 'John', email: 'johnman@gmail.com',last_name: "Man", password: '123', password_confirmation:'12' )
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
 

  
    it "throws error when given no values for passwords" do
      @user = User.create(name: 'John', email: 'johnman@gmail.com',last_name: "Man", password: nil, password_confirmation:nil )
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
  

  
    it "throws error when a second user tries to use an already existing email" do
      @user1 = User.create(name: 'John', last_name: "Man", email: 'johnman@gmail.com', password: '12345', password_confirmation:'12345' )
      @user2 = User.create(name: 'John', last_name: "Man", email: 'johnman@gmail.com', password: '12345', password_confirmation:'12345' )
      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
  

  
    it "throws an error if password is too short" do
      @user = User.create(name: 'John', last_name: "Man", email: 'johnman@gmail.com', password: '1234', password_confirmation:'1234' )
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end
  
end

  describe ".authenticate_with_credentials" do

    it "should show successful login with right credentials" do
    @user = User.create!(name: 'John', last_name: "Man", email: 'johnny@gmail.com', password: '12345', password_confirmation:'12345' )
    @login = User.authenticate_with_credentials('johnny@gmail.com','12345' )
    expect(@user).to eq(@login)
    end

    it "should show unsuccessful login with wrong credentials" do
      @user = User.create!(name: 'John', last_name: "Man", email: 'johnny@gmail.com', password: '12345', password_confirmation:'12345' )
      @login = User.authenticate_with_credentials('johnn@gmail.com','1234' )
      expect(@login).to eq(nil)
    end

    it "should show unsuccessful login with wrong credentials" do
      @user = User.create!(name: 'John', last_name: "Man", email: 'johnny@gmail.com', password: '12345', password_confirmation:'12345' )
      @login = User.authenticate_with_credentials('johnn@gmail.com','1234' )
      expect(@login).to eq(nil)
    end
    
    it "should show successful login with different letter case" do
      @user = User.create!(name: 'John', last_name: "Man", email: 'johnny@gmail.com', password: '12345', password_confirmation:'12345' )
      @login = User.authenticate_with_credentials('johnny@GMAIL.com','12345' )
      expect(@user).to eq(@login)
    end

    it "should show successful login with different added whitespace" do
      @user = User.create!(name: 'John', last_name: "Man", email: 'johnny@gmail.com', password: '12345', password_confirmation:'12345' )
      @login = User.authenticate_with_credentials('    johnny@gmail.com   ','12345' )
      expect(@user).to eq(@login)
    end
  
  end

end 