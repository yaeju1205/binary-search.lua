local floor = math.floor

--- @class BinarySearch.Options 
--- @field use_collection_sort boolean -- Sort the collection
--- @field use_collection_copy boolean -- If enable the collection sort, copy of collection
local default_options = {
    -- Sort the collection
    use_collection_sort = false,
    -- If enable the collection sort, copy of collection
    use_collection_copy = true,
}

--- @generic T
--- @generic U
--- @param t table<T, U>
--- @return table<T, U>
local function deep_copy(t)
    if type(t) ~= 'table' then return t end
    local res = {}
    for k, v in pairs(t) do
        res[deep_copy(k)] = deep_copy(v)
    end
    return res
end

--- @generic T
--- @param collection T[]
--- @param target T
--- @param options? BinarySearch.Options
--- @return number?
return function(collection, target, options)
    options = options or default_options
    if options.use_collection_sort then
        if options.use_collection_copy then
            collection = deep_copy(collection)
        end
        table.sort(collection)
    end

    local low = 1
    local high = #collection

    while low <= high do
        local mid = floor(low + (high - low) / 2)
        local peek_data = collection[mid]
        if peek_data == target then
            return mid
        elseif peek_data < target then
            low = mid + 1
        else
            high = mid - 1
        end
    end
end
