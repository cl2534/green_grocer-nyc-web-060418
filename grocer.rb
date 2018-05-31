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
  coupons.each do |i|
    itemname = i[:item]
    if cart[itemname] == i[:num] <= cart[itemname][:count]
      if cart["#{itemname} W/COUPON"]
        cart["#{itemname} W/COUPON"][:count] += 1
      else
        cart["#{itemname} W/COUPON"] = {:count => 1, :price => i[:cost]}
        cart["#{itemname} W/COUPON"][:clearance] = cart[itemname][:clearance]
      end
      cart[itemname][:count] -= i[:num]
    end
  end
  cart
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


