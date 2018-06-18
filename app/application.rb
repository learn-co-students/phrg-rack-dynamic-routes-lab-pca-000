require 'pry'
class Application
@@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item_name = req.path.split("/items/").last
    resp.write handle_req(item_name)

  end

  def handle_req(item_name)
    if @@items.length == 0
      return "Item not found"
      resp.status = 404
    else
      items = @@items.select do |item|
      item.name = item_name
      end
    end

    if items.length != 0
      return items[0].price
    else
      return "Item not found"
      resp.status = 404

    end
  end
end

