require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  Describe "should return all records from the database" do
    it "should return all records for users" do
      expect( User.index()).to eql([])
    end
  end
end
