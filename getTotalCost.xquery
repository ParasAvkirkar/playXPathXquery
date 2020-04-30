for $unique_pid in distinct-values(doc("products.xml")//product/@pid)
let $price:=xs:float(doc("products.xml")//product[@pid=$unique_pid]/description/price/text())
let $quantity:=xs:float(sum(doc("purchaseorders.xml")//item[partid=$unique_pid]/quantity))
let $totalCost:=$quantity * $price
return <totalcost partid="{$unique_pid}">{$totalCost}</totalcost>