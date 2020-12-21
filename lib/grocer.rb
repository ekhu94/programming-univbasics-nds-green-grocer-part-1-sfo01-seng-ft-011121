def find_item_by_name_in_collection(name, collection)
  collection.each do |hash|
    hash.each { |k, v| return hash if hash[:item] == name }
  end
  nil
end

def consolidate_cart(cart)
  checkout = []
  cart.each_with_index do |hash, i|
    if find_item_by_name_in_collection(hash[:item], checkout) == nil
      hash[:count] = 1
      checkout.push(hash)
    else
      find_item_by_name_in_collection(name, collection)[:count] += 1
    end
  end
  checkout
end

unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]
 
puts consolidate_cart(unconsolidated_cart) 