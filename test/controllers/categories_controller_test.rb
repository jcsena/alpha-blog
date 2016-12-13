require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create({name: 'Sports'});
    @user = User.create({username: 'jhon', email: 'jhon@example.com', password:'password', admin:true})

  end

  test 'shloud get categories index' do
    get :index
    assert_response :success
  end

  test 'shloud get categories new' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test 'shloud get categories show' do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test 'should redirect create when admin not legged in' do
    assert_no_difference 'Category.count' do
      post :create , category: {name: 'sportss'}
    end
    assert_redirected_to categories_path
  end
end