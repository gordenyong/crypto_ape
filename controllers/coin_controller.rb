require 'pry'
get '/' do
    coin_items = all_coins()
    erb :'coins/index', locals: {
      coin_items: coin_items
    }
end
  
get '/coins/new' do
    erb :'coins/new'
end
  
post '/coins' do
    name = params["name"]
    image_url = params["image_url"]

    create_coin(name, image_url)

    redirect '/'
end
  
get '/coins/:id/edit' do
    id = params["id"]
    coin = get_coin(id)

    erb :'coins/edit', locals: {
      coin: coin
    }
end

put '/coin/:id' do
    id = params['id']
    name = params['name']
    image_url = params['image_url']
    
    update_coin(id,name,image_url)
    redirect '/'
end
  
delete '/coins/:id' do
    id = params['id']
  
    delete_coin(id)
    redirect '/'
end

get '/details' do
    coin_data = HTTParty.get("http://api.binance.com/api/v1/ticker/allPrices").parsed_response
    
    # erb :'coins/details', locals: {
    #     coin_data: coin_data["status"]
    # }
    
    p coin_data
    ""
end



