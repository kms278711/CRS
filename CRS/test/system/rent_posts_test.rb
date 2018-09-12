require "application_system_test_case"

class RentPostsTest < ApplicationSystemTestCase
  setup do
    @rent_post = rent_posts(:one)
  end

  test "visiting the index" do
    visit rent_posts_url
    assert_selector "h1", text: "Rent Posts"
  end

  test "creating a Rent post" do
    visit rent_posts_url
    click_on "New Rent Post"

    fill_in "Aperture", with: @rent_post.aperture
    fill_in "Content", with: @rent_post.content
    fill_in "Distance", with: @rent_post.distance
    fill_in "Is", with: @rent_post.is
    fill_in "Lens Img", with: @rent_post.lens_img
    fill_in "Lens Name", with: @rent_post.lens_name
    fill_in "Location", with: @rent_post.location
    fill_in "Mount", with: @rent_post.mount
    fill_in "Price", with: @rent_post.price
    fill_in "Rented", with: @rent_post.rented
    fill_in "Zoom Lens", with: @rent_post.zoom_lens
    click_on "Create Rent post"

    assert_text "Rent post was successfully created"
    click_on "Back"
  end

  test "updating a Rent post" do
    visit rent_posts_url
    click_on "Edit", match: :first

    fill_in "Aperture", with: @rent_post.aperture
    fill_in "Content", with: @rent_post.content
    fill_in "Distance", with: @rent_post.distance
    fill_in "Is", with: @rent_post.is
    fill_in "Lens Img", with: @rent_post.lens_img
    fill_in "Lens Name", with: @rent_post.lens_name
    fill_in "Location", with: @rent_post.location
    fill_in "Mount", with: @rent_post.mount
    fill_in "Price", with: @rent_post.price
    fill_in "Rented", with: @rent_post.rented
    fill_in "Zoom Lens", with: @rent_post.zoom_lens
    click_on "Update Rent post"

    assert_text "Rent post was successfully updated"
    click_on "Back"
  end

  test "destroying a Rent post" do
    visit rent_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rent post was successfully destroyed"
  end
end
