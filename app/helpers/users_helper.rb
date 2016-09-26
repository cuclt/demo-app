module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = {size: 80})
    size = options[:size]
    image_tag("avatar.png", alt: user.name)
  end
end
