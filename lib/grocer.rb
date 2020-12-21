def find_item_by_name_in_collection(name, collection)
  collection.each do |hash|
    hash.each { |k, v| return hash if hash[:item] == name }
  end
  nil
end

def consolidate_cart(cart)
  checkout = []
  cart.each do |hash|
    name = hash[:item]
    if find_item_by_name_in_collection(name, checkout) == nil
      hash[:count] = 1
      checkout.push(hash)
    else
      return
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