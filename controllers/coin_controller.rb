
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
    symbol = params["symbol"]
   
    create_coin(name,symbol,image_url)

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
    
    coin_data = HTTParty.get("https://api.coincap.io/v2/assets/?search=#{params["coin_search"]}&limit=1").parsed_response
    
    erb :'coins/details', locals: {

        name: coin_data["data"][0]["name"],
        symbol: coin_data["data"][0]["symbol"],
        market_cap: coin_data["data"][0]["marketCapUsd"].to_i,
        price: coin_data["data"][0]["priceUsd"].to_f.round(2),
        one_day_percent_change: coin_data["data"][0]["changePercent24Hr"].to_f.round(3),
        supply: coin_data["data"][0]["supply"].to_i,
        max_supply: coin_data["data"][0]["maxSupply"].to_i,
        one_day_volume: coin_data["data"][0]["volumeUsd24Hr"].to_i

    }
end



