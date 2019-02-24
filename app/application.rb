class Application
  
  @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]
  
  def call(env) 
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    item_name = req.path.split("/items/").last
  
    if req.path.include?
      item = @@items.each{|i| i.name == item_name}
        if @@items.include?(item)
      
        # if @@items.include?(item_name)
        #   item =  @@items.find{|el| el.name == item_name}
        #   resp.write item.price
        # else 
        #   resp.write "Item not found"
        #   resp.status = 400
        # end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end