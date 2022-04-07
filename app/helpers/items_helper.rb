module ItemsHelper
  def ensure_json_request
    params[:format] == 'json' || request.headers['Accept'] =~ /json/
  end

  def save_item_variants(is_update: false)
    @item.item_variants.destroy_all if is_update
    @item_variants = item_params[:variants]

    @item_variants&.each do |item_variant|
      parse = JSON.parse(item_variant)
      image_index = parse['imageIndex']
      parse['image_index'] = image_index
      parse.delete('imageIndex')
      new_item_variant = ItemVariant.new(parse)
      new_item_variant.skip_image_index_presence_validation = true if ensure_json_request
      new_item_variant.item_id = @item.id
      new_item_variant.store_id = @item.store_id

      new_item_variant.save
    end
  end

  def save_tags(is_update: false)
    @item.tags.destroy_all if is_update
    @tags = item_params[:tags]
    @tags&.each do |tag|
      parse = JSON.parse(tag)
      new_tag = Tag.new(parse)
      new_tag.item_id = @item.id
      new_tag.save
    end
  end

  def add_stars(items)
    items.each do |item|
      item.latest_5_comments.first(5)
      item.stars = {}
      sum_of_star_numbers = 0
      item.item_stars.each do |star|
        sum_of_star_numbers += star.number
      end

      item.stars['number'] =
        item.item_stars.size.positive? ? (sum_of_star_numbers / item.item_stars.size).ceil : 0
      item.stars['reviewers'] = item.item_stars.length
    end
  end
end
