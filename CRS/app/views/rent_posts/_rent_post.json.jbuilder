json.extract! rent_post, :id, :lens_name, :lens_img, :mount, :zoom_lens, :distance, :aperture, :is, :location, :price, :rented, :content, :created_at, :updated_at
json.url rent_post_url(rent_post, format: :json)
