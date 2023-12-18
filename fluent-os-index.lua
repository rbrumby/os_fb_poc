function set_index(tag, timestamp, record)
  local base
  if tag=="srv" then
    base="islogs-"
  else
    base="msglogs-"
  end;
  record.opensearch_index=base .. os.date("%Y-%m")
  return 1, timestamp, record
end
