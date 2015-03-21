module Articles
  module Filter
    
    def filter(options = {})
    
      options[:filter_mask] ||= nil
      options[:search_text] ||= ''
      options[:page] ||= 1
      
      search_conditions = {}
      search_conditions[:page] = options[:page]
      search_conditions[:per_page] = SETTINGS[:articles_per_page].to_s
      search_conditions[:order] = "created_at DESC"
      
      if Category.any? && options[:filter_mask]
        search_conditions[:with] = { category_id: category_ids(options[:filter_mask]) } 
      end
      
      search(options[:search_text], search_conditions)
    end
    
    private
    
    def category_ids(filter_mask)
      categories = Category.all.select do |category| 
        category.id & filter_mask.to_i == category.id
      end
      categories.map(&:id)
    end
    
  end
end