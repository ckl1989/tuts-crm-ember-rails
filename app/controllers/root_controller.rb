class RootController < ActionController::API
  def index
    # revision = $redis.get('relationship:index:current')
    # render html: $redis.get("relationship:index:#{revision}").html_safe
  end
end
