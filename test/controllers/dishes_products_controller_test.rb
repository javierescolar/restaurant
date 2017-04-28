require 'test_helper'

class DishesProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dishes_product = dishes_products(:one)
  end

  test "should get index" do
    get dishes_products_url
    assert_response :success
  end

  test "should get new" do
    get new_dishes_product_url
    assert_response :success
  end

  test "should create dishes_product" do
    assert_difference('DishesProduct.count') do
      post dishes_products_url, params: { dishes_product: { plate_id: @dishes_product.plate_id, product_id: @dishes_product.product_id } }
    end

    assert_redirected_to dishes_product_url(DishesProduct.last)
  end

  test "should show dishes_product" do
    get dishes_product_url(@dishes_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_dishes_product_url(@dishes_product)
    assert_response :success
  end

  test "should update dishes_product" do
    patch dishes_product_url(@dishes_product), params: { dishes_product: { plate_id: @dishes_product.plate_id, product_id: @dishes_product.product_id } }
    assert_redirected_to dishes_product_url(@dishes_product)
  end

  test "should destroy dishes_product" do
    assert_difference('DishesProduct.count', -1) do
      delete dishes_product_url(@dishes_product)
    end

    assert_redirected_to dishes_products_url
  end
end
