require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # Setting up a user object.
  def setup
    @user = User.new(name: "Petar", email: "p.zdravkov1617@gmail.com",
    					password: "examplepass", password_confirmation: "examplepass")
  end
  
  test "test valid user" do
    assert @user.valid?
  end
  
  test "test parameter presence" do
    @user.name = ""
    assert_not @user.valid?
    
    @user.name = "Petar"
    
    @user.email = ""
    assert_not @user.valid?
    
    @user.email = "p.zdravkov1617@gmail.com"
    
    @user.password = @user.password_confirmation = "a"*4
    assert_not @user.valid?
  end
  
  test "test parameter length" do
    @user.name = "a"*64
    assert_not @user.valid?
    
    @user.name = "Petar"
    
    @user.email = "b"*128
    assert_not @user.valid?
    
    @user.email = "p.zdravkov1617@gmail.com"
    
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
  
  test "test valid email format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "test invalid email format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "test unique user" do
    dupu = @user.dup
    dupu.email = @user.email.upcase
    @user.save
    assert_not dupu.valid?
  end
  
  test "testing email conversion" do
    test_email = "P.ZDRAVKOV1617@gmail.com"
    @user.email = test_email
    @user.save
    assert_equal test_email.downcase, @user.reload.email
  end
  
end
