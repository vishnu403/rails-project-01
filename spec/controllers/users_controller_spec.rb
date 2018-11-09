require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "testing for get /index" do
    it "should get all records for users" do
      put :index
      expect(response).to be_success
    end
  end
  describe "testing for post /create" do
    it "should create new records for a user" do
      post :create, :user => { "name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":12345678}
      # expect(response).to have_http_status(200)
      expect(response.body).to include("created")
    end
  end
  describe "testing for put /update/:id" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":12345678)
      @user = put 'update', :id => @user.id , :user => {"name": 'newmail@ya.ru',"age":22,"country":"India","phone_no":12345678}
    end
    it "should update records for user" do
      expect(response.body).to include("updated")
    end
  end
  describe "testing for delete /delete/:id" do
    before do
      @user = User.create("name": 'newmail@ya.ru',"age":23,"country":"India","phone_no":12345678)
      @user = put 'delete', :id => @user.id
    end
    it "should delete record for the given user" do
      expect(response.body).to include("deleted")
    end
  end
end
