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
  new_hash = {}
  coupons.each do |coupon|
    coupon.each do |coupon_key, coupon_value|
      cart.each do |item_name, item_attributes|
        new_hash[item_name] = item_attributes
        if coupon_value == item_name
          if coupon[:num] >= item_attributes[:count]
            item_w_coupon = "#{item_name} W/COUPON"
            new_hash[item_w_coupon] = item_attributes
            new_hash[item_w_coupon][:count] = coupon[:num]
            new_hash[item_w_coupon][:price] = coupon[:cost]
            binding.pry
            new_hash[item_name][:count] = (item_attributes[:count] - coupon[:num])
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
