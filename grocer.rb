def consolidate_cart(cart)
  result = {}
  count = 0 
  cart.each do |item|
    if result.include?(item.keys[0])
      count += 1 
    else 
      count = 1 
    end 
    item.each do |item, info|
      info.each do |key, value|
        result[item] = info 
      end 
      result[item][:count] = count 
    end 
  end 
  result
end


def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


