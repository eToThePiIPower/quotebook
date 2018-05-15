module ApplicationHelper
  def gravatar_url(email, size = nil)
    gravatar = Digest::MD5.hexdigest(email).downcase

    if size.nil?
      "http://gravatar.com/avatar/#{gravatar}.png"
    else
      "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
    end
  end
end
