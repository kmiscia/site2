module Articles
  module Filter
    
    def filter(filter_mask, params)

      search_conditions = {}
      search_conditions[:page] = params[:page] || 1
      search_conditions[:per_page] = SETTINGS[:articles_per_page].to_s
      search_conditions[:order] = "created_at DESC"
      search_conditions[:with] = { category_id: category_ids(filter_mask) } if filter_mask
      
      search(params[:search_text] || '', search_conditions)
    end
    
    private
    
    def category_ids(filter_mask)
      categories = Category.all.select { |category| category.id & filter_mask.to_i == 0 }
      category_ids = categories.map(&:id)
      category_ids << nil # No idea why this is here
      category_ids
    end
    
  end
end