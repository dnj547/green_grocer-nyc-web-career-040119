require 'pry'
def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |item_name, item_attributes|
      if !new_hash[item_name]
        new_hash[item_name] = item_attributes
        new_hash[item_name][:count] = 1
      elsif new_hash[item_name]
        new_hash[item_name][:count] += 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = cart[name]
        cart["#{name} W/COUPON"][:price] = coupon[:cost]
        binding.pry
        cart["#{name} W/COUPON"][:count] = coupon[:num]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
