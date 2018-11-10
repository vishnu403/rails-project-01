require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "testing for get /index" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234567890)
      @user = User.create("name": 'newmail',"age":23,"country":"India","phone_no":1234567890)
    end
    it "should get all records for users" do
      put :index
      expect(User.count).to eql(2)
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for post /create" do
    it "should create new records for a user" do
      post :create, :user => { "name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234567890}
      expect(JSON.parse(response.body)["name"]).to eql('newmail@ya.ru')
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for put /update/:id" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234567890)
      put 'update', :id => @user.id , :user => {"name": 'newmail@ya.ru',"age":23,"country":"Brazil","phone_no":1234567890}
    end
    it "should update records for user" do
      expect(JSON.parse(response.body)["country"]).to eql("Brazil")
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for delete /delete/:id" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234567890)
      put 'delete', :id => @user.id
    end
    it "should delete record for the given user" do
      expect(JSON.parse(response.body)["id"]).to eql(@user.id)
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for phone_no validation" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":12345670)
    end
    it "should return error" do
      expect((@user.errors.messages)).to eql({"phone_no":["is too short (minimum is 10 characters)"]})
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for phone_no validation" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234569099970)
    end
    it "should return error" do
      expect((@user.errors.messages)).to eql({"phone_no":["is too long (maximum is 10 characters)"]})
    end
    after do
      User.destroy_all
    end
  end
  describe "testing for put /update/:id with phone_no validation" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":1234567890)
      put 'update', :id => @user.id , :user => {"name": 'newmail@ya.ru',"age":23,"country":"Brazil","phone_no":12345670}
    end
    it "should update records for user" do
      expect(JSON.parse(response.body)).to eql({"phone_no"=> ["is too short (minimum is 10 characters)"]})
    end
    after do
      User.destroy_all
    end
  end
end
