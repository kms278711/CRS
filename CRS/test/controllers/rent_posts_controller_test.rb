require 'test_helper'

class RentPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent_post = rent_posts(:one)
  end

  test "should get index" do
    get rent_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_rent_post_url
    assert_response :success
  end

  test "should create rent_post" do
    assert_difference('RentPost.count') do
      post rent_posts_url, params: { rent_post: { aperture: @rent_post.aperture, content: @rent_post.content, distance: @rent_post.distance, is: @rent_post.is, lens_img: @rent_post.lens_img, lens_name: @rent_post.lens_name, location: @rent_post.location, mount: @rent_post.mount, price: @rent_post.price, rented: @rent_post.rented, zoom_lens: @rent_post.zoom_lens } }
    end

    assert_redirected_to rent_post_url(RentPost.last)
  end

  test "should show rent_post" do
    get rent_post_url(@rent_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_rent_post_url(@rent_post)
    assert_response :success
  end

  test "should update rent_post" do
    patch rent_post_url(@rent_post), params: { rent_post: { aperture: @rent_post.aperture, content: @rent_post.content, distance: @rent_post.distance, is: @rent_post.is, lens_img: @rent_post.lens_img, lens_name: @rent_post.lens_name, location: @rent_post.location, mount: @rent_post.mount, price: @rent_post.price, rented: @rent_post.rented, zoom_lens: @rent_post.zoom_lens } }
    assert_redirected_to rent_post_url(@rent_post)
  end

  test "should destroy rent_post" do
    assert_difference('RentPost.count', -1) do
      delete rent_post_url(@rent_post)
    end

    assert_redirected_to rent_posts_url
  end
end
