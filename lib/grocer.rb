def find_item_by_name_in_collection(name, collection)
  collection.each do |hash|
    hash.each { |k, v| return hash if hash[:item] == name }
  end
  nil
end

def consolidate_cart(cart)
  checkout = []
  cart.each do |hash|
    item = find_item_by_name_in_collection(hash[:item], checkout)
    if !item
      hash[:count] = 1
      checkout.push(hash)
    else
      item[:count] += 1
    end
  end
  checkout
end

unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

print consolidate_cart(unconsolidated_cart)
puts