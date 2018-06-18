require 'pry'
class Application
@@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item_name = req.path.split("/items/").last
    if req.path.split("/items/")[1] == nil

      resp.status = 404
      resp.write "Route not found"

    else

      items = @@items.find do |item|
      item.name == item_name
      end
      if items != nil
      resp.write items.price

      else
      resp.status = 400
      resp.write "Item not found"


      end

    end
    resp.finish
  end

  # def handle_req(item_name)
  #   resp = Rack::Response.new
  #   if @@items.length == 0
  #     resp.status = 404
  #     return "Route not found"

  #   else
  #     items = @@items.select do |item|
  #     item.name = item_name
  #     end
  #   end

  #   if items.length != 0
  #     return items[0].price
  #   else
  #     resp.status = 404
  #     return "Item not found"


  #   end
  # end
end

