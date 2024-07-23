defmodule PaintByNumber do
  def palette_bit_size(color_count, power \\ 0) do
    if Integer.pow(2, power) >= color_count do
      power
    else
      palette_bit_size(color_count, power + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture == "", do: nil

  def get_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<first_pixel::size(size), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(picture, _color_count) when picture == "", do: ""

  def drop_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<_first_pixel::size(size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
