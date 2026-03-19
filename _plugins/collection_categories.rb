# _plugins/collection_categories.rb
Jekyll::Hooks.register :site, :post_read do |site|
  site.collections.each do |label, collection|
    next if label == "posts"
    collection.docs.each do |doc|
      Array(doc.data["categories"]).each do |cat|
        site.categories[cat] ||= []
        site.categories[cat] << doc
      end
    end
  end
end
