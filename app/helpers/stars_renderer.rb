class StarsRenderer
  def initialize(rating, helper)
    @rating = rating
    @helper = helper
  end

  def render_stars
    content_tag :div, star_images.html_safe, class: 'stars'
  end

  ##################
  private
  ##################

  def star_images
    (0...5).to_a.collect do |position|
      star_image(((@rating - position) * 2).round)
    end.join
  end

  def star_image(value)
    image_tag "#{star_type(value)}_star.gif", size: '15x15'
  end

  def star_type(value)
    if value <= 0
      'empty'
    else
      'full'
    end
  end

  def method_missing(*args, &block)
    @helper.send *args, &block
  end
end
