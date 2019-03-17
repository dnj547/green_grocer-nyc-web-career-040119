require 'pry'
def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |item_name, item_attributes|
      if !new_hash.key?(item_name)
        new_hash[item_name] = item_attributes
        new_hash[item_name][:count] = 1
      elsif new_hash.key?(item_name)
        new_hash[item_name][:count] += 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  new_hash = cart.clone
  coupons.each do |coupon|
    coupon.each do |coupon_key, coupon_value|
      cart.each do |item_name, item_attributes|
        if coupon[:item] == item_name
          if coupon[:num] >= item_attributes[:count]
            without = item_attributes[:count] - coupon[:num]
            new_hash["#{item_name} W/COUPON"] = item_attributes
            binding.pry
            new_hash["#{item_name} W/COUPON"][:count] = coupon[:num]
            new_hash["#{item_name} W/COUPON"][:price] = coupon[:cost]
            new_hash[item_name][:count] = without
          end
        end
      end
    end
  end
  new_hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
