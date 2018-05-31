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
    if cart[itemname] && i[:num] <= cart[itemname][:count]
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

def apply_clearance(cart)
  cart.each do |item, data| 
    if cart[item][:clearance] == true
      discount = cart[item][:price] * 0.8
      cart[item][:price] = discount.round(2) 
    end 
  end 
  cart 
end

 def checkout(cart, coupons)
  total = 0.0
  new_cart = cart
  consolidate_cart(new_cart)
  apply_coupons(new_cart, coupons)
  apply_clearance(new_cart)
  new_cart.each do |item, data|
+    total_counter += (new_cart[item][:price] * new_cart[item][:count])
+  end
+  if total_counter > 100.0
+    total_counter = total_counter * 0.9
+  end
+  return total_counter
 end
