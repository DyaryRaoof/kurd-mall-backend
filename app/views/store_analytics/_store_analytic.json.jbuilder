json.extract! store_analytic, :id, :store_id, :stroe_name, :lifetime_views, :total_stars, :total_reviews, :total_shares, :total_comments, :total_revenue_usd, :total_revenue_iqd, :total_item_sales, :created_at, :updated_at
json.url store_analytic_url(store_analytic, format: :json)
