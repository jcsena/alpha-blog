require 'test_helper'

class  CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create({name: "Sports"});
  end

  test "shloud get categories index" do
    get :index
    assert_response :success
  end

  test "shloud get categories new" do
    get :new
    assert_response :success
  end

  test "shloud get categories show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
end