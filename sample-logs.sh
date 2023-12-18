#!/bin/bash
while true
do
  sleep $(printf "%s.%s\n" $(($RANDOM % 5)) $(($RANDOM % 100))) # sleep for 0 to 5 seconds with decimals
  ts=$(date "+%Y-%m-%dT%H:%M:%S.000")
  case $(($RANDOM % 3)) in
    0)
      target="MES"
      entity="item"
      key="\"part-number\": \"PRT-$RANDOM\""
    ;;
    1)
      target="MES"
      entity="workorder"
      key="\"work-order\": \"WO-$RANDOM\""
    ;;
    2)
      target="Timekeeping"
      entity="workorder"
      key="\"work-order\": \"WO-$RANDOM\""
    ;;
  esac
  case $(($RANDOM % 10)) in
    0)
      logtype="ERROR"
      msg=$(sed "$((1 + ($RANDOM % 5)))q;d" sample-errors.dat)
    ;;
    *)
      logtype="SUCCESS"
      msg="Completed successfully"
    ;;
  esac
  doc="{\"@timestamp\": \"$ts\", \"entity\": \"$entity\", \"target\": \"$target\", \"log-type\": \"$logtype\", $key, \"message\": \"$msg\"}"
  curl -kv -H "Content-Type: application/json" \
  -XPOST -d "$doc" \
  https://admin:admin@localhost:9200/msglogs-${entity}-dec-2023/_doc
done
