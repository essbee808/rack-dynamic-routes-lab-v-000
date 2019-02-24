class Application
  
  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]
  
  def call(env) 
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  
    item_name = req.path.split("/items/").last
    
    if req.path=="/items/'#{item_name}'" && @@items.include?(item_name)
        item = @@items.each do |el| 
          if el.name == item_name
            resp.write item.price
            resp.status = 200
          else 
            
       
    elsif req.path=="/items/'#{item_name}'" && @@items.include?(item_name)
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end