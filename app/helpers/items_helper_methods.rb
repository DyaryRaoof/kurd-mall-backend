module ItemsHelperMethods
  def home_index
    @items = []
    subs = JSON.parse(params[:subcategory_ids])
    count = Item.count
    @items = if count < 100
               Item.includes(:item_variants, :tags, :latest_5_comments, :item_stars).all.with_attached_images
             else
               Item.includes(:item_variants, :tags, :latest_5_comments,
                             :item_stars).where(subcategory_id: subs).limit(300).with_attached_images
             end

    add_stars(@items)

    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def related_items
    @items = Item.includes(:item_variants, :tags)
      .where('(name = ?) or (name like ?) or (name like ?) or (name like ?)',
             params[:name],
             "% #{params[:name]} %",
             "#{params[:name]} %",
             "% #{params[:name]}").where.not(id: params[:id]).limit(30).with_attached_images
    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def subcategory_items
    @items = []
    subs = params[:subcategory_id]
    @items = Item.includes(:item_variants, :tags, :latest_5_comments,
                           :item_stars).where(subcategory_id: subs)
      .paginate(page: params[:page], per_page: 30)
      .with_attached_images

    add_stars(@items)

    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def my_items
    @items = Item
      .includes(:item_variants, :tags, :latest_5_comments,
                :item_stars).where(user_id: params[:user_id])
      .paginate(page: params[:page], per_page: 30).with_attached_images

    add_stars(@items)
    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def search
    from = params[:price_from] == 'null' ? 0 : params[:price_from]
    to = params[:price_to] == 'null' ? 10_000_000_000 : params[:price_to]
    ascending = params[:ascending] == 'true' ? :asc : :desc
    @items = Item
      .includes(:item_variants, :tags, :latest_5_comments, :item_stars)
      .where(price: from..to)
      .where(currency: params[:currency])
      .where('(items.name = ?) or (items.name like ?) or (items.name like ?) or (items.name like ?)',
             params[:name],
             "%#{params[:name]}%",
             "#{params[:name]} %",
             "% #{params[:name]}")
      .order(price: ascending)
      .paginate(page: params[:page], per_page: 30).with_attached_images

    add_stars(@items)
    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def store_items
    @items = Item
      .includes(:item_variants, :tags, :latest_5_comments,
                :item_stars)
      .where(store_id: params[:store_id])
      .paginate(page: params[:page], per_page: 30)
      .with_attached_images

    add_stars(@items)
    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end
end
