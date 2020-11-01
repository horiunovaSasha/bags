require 'test_helper'

class ProductAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_attribute = product_attributes(:one)
  end

  test "should get index" do
    get product_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_product_attribute_url
    assert_response :success
  end

  test "should create product_attribute" do
    assert_difference('ProductAttribute.count') do
      post product_attributes_url, params: { product_attribute: { attribute: @product_attribute.attribute, product: @product_attribute.product, value: @product_attribute.value } }
    end

    assert_redirected_to product_attribute_url(ProductAttribute.last)
  end

  test "should show product_attribute" do
    get product_attribute_url(@product_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_attribute_url(@product_attribute)
    assert_response :success
  end

  test "should update product_attribute" do
    patch product_attribute_url(@product_attribute), params: { product_attribute: { attribute: @product_attribute.attribute, product: @product_attribute.product, value: @product_attribute.value } }
    assert_redirected_to product_attribute_url(@product_attribute)
  end

  test "should destroy product_attribute" do
    assert_difference('ProductAttribute.count', -1) do
      delete product_attribute_url(@product_attribute)
    end

    assert_redirected_to product_attributes_url
  end
end