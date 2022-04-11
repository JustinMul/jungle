require 'rails_helper'

RSpec.describe User, type: :model do
  describe "correct inputs" do
    it "returns successfully when given all input values" do
      @user = User.create(name: 'John', last_name: "Man", email: 'john@gmail.com', password: '12345', password_confirmation:'12345' )
      expect(@user).to be_valid
    end
  end

  describe "Password not matching confirmation" do
    it "throws error when given incorrect password confirmation" do
      @user = User.create(name: 'John', email: 'john@gmail.com',last_name: "Man", password: '123', password_confirmation:'12' )
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
