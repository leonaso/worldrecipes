module ApplicationHelper
  def gravatar_for(chef, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: chef.chef_name, class: "img-circle")
  end
  
#  def gravatar_for(ingredient, options = {size: 80})
    #gravatar_id = Digest::MD5::hexdigest(ingredient.chef.email.downcase)
#    size = options[:size]
#    gravatar_url = "/assets/images/Tomates.jpg?s=#{size}"
#    image_tag(gravatar_url, alt: "Tomates", class: "img-circle")
#  end

end
