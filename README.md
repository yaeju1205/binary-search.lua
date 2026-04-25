# binary-search.lua
the simple implement binary-search for lua

## usage
```lua
local binary_search = require(...)

local collection = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
local target = 4
local target_index = binary_search(collection, target)

print(collection[target_index] == target)
```

## options
```lua
binary_search(collection, target, {
    -- Sort the collection
    use_collection_sort = false,
    -- If enable the collection sort, copy of collection
    use_collection_copy = true,
})
```
