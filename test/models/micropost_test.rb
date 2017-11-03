require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum",content2: "Lorem ipsum",content3: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    @micropost.content2 = "   "
    @micropost.content3 = "   "    
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    @micropost.content2 = "a" * 141
    @micropost.content3 = "a" * 141    
    assert_not @micropost.valid?
  end
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end  
end