require "application_system_test_case"

class ProductFeaturesTest < ApplicationSystemTestCase
  setup do
    @product_feature = product_features(:one)
  end

  test "visiting the index" do
    visit product_features_url
    assert_selector "h1", text: "Product Features"
  end

  test "creating a Product feature" do
    visit product_features_url
    click_on "New Product Feature"

    fill_in "Feature", with: @product_feature.feature_id
    fill_in "Product", with: @product_feature.product_id
    click_on "Create Product feature"

    assert_text "Product feature was successfully created"
    click_on "Back"
  end

  test "updating a Product feature" do
    visit product_features_url
    click_on "Edit", match: :first

    fill_in "Feature", with: @product_feature.feature_id
    fill_in "Product", with: @product_feature.product_id
    click_on "Update Product feature"

    assert_text "Product feature was successfully updated"
    click_on "Back"
  end

  test "destroying a Product feature" do
    visit product_features_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product feature was successfully destroyed"
  end
end
