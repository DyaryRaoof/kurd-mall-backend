json.extract! item_analytic, :id, :item_id, :item_name, :lifetime_views, :total_stars, :total_reviews, :total_shares,
              :total_comments, :total_revenue_usd, :total_revenue_iqd, :total_item_sales, :created_at, :updated_at
json.url item_analytic_url(item_analytic, format: :json)
