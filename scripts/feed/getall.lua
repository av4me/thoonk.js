--name
ids = redis.call('zrange', 'feed.ids:'..ARGV[1], 0, -1)
result = {}
for i, id in ipairs(ids) do
    value = redis.call('hget', 'feed.items:'..ARGV[1], id)
    table.insert(result, {id, value})
end
return {false, result}
