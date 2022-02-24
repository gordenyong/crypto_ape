def all_coins()
    run_sql("SELECT * FROM coins ORDER BY ID;")
end

def get_coin(id)
    run_sql("SELECT * FROM coins WHERE id=$1", [id])[0]
end

def create_coin(name,symbol,image_url)
    run_sql("INSERT INTO coins(name,symbol,image_url) VALUES($1,$2,$3)", [name,symbol,image_url])
end

def update_coin(id,name,image_url)
    run_sql("UPDATE coins SET name=$2, image_url=$3 WHERE id=$1", [id,name,image_url])
end

def delete_coin(id)
    run_sql("DELETE FROM coins WHERE id=$1", [id])
end
