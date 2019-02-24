class Application
  
  @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]
  
  def call(env) 
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  
    item_name = req.path.split("/items/").last
    
    if req.path=="/items/" + item_name && @@items.include?(item_name)
        @@items.detect do |el| 
          el.name == item_name
        end
          resp.write el.price
            resp.status = 200
          else 
            resp.write "Item not found"
            resp.status = 400
          end
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end