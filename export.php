<?php
header("Content-Type: application/xml; charset=UTF-8");

$mysqli = new mysqli("localhost", "root", "root", "lab3(3)");
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

$settings = $mysqli->query("SELECT * FROM settings LIMIT 1")->fetch_assoc();

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
echo "<price>\n";
echo "<date>{$settings['date']}</date>\n";
echo "<firmName>{$settings['firmName']}</firmName>\n";
echo "<firmId>{$settings['firmId']}</firmId>\n";
echo "<rate>{$settings['rate']}</rate>\n";


$result = $mysqli->query("SELECT * FROM deliveries");
while ($row = $result->fetch_assoc()) {
    echo "<delivery id=\"{$row['id']}\" type=\"{$row['type']}\" carrier=\"{$row['carrier']}\" cost=\"{$row['cost']}\"";
    if (!is_null($row['freeFrom'])) echo " freeFrom=\"{$row['freeFrom']}\"";
    if (!empty($row['city'])) echo " city=\"{$row['city']}\"";
    echo " />\n";
}

$result = $mysqli->query("SELECT * FROM stores");
while ($row = $result->fetch_assoc()) {
    echo "<store id=\"{$row['id']}\" name=\"{$row['name']}\" address=\"{$row['address']}\"";
    echo " workdays_from=\"{$row['workdays_from']}\" workdays_to=\"{$row['workdays_to']}\"";
    echo " sat_from=\"{$row['sat_from']}\" sat_to=\"{$row['sat_to']}\"";
    echo " sun_from=\"{$row['sun_from']}\" sun_to=\"{$row['sun_to']}\"";
    echo " tel=\"{$row['tel']}\"";
    echo " />\n";
}

echo "<categories>\n";
$result = $mysqli->query("SELECT * FROM categories");
while ($row = $result->fetch_assoc()) {
    echo "<category>\n";
    echo "<id>{$row['id']}</id>\n";
    if ($row['parentId']) echo "<parentId>{$row['parentId']}</parentId>\n";
    echo "<name>{$row['name']}</name>\n";
    echo "</category>\n";
}
echo "</categories>\n";

echo "<items>\n";
$result = $mysqli->query("SELECT * FROM products");
while ($row = $result->fetch_assoc()) {
    echo "<item>\n";
    echo "<id>{$row['id']}</id>\n";
    echo "<categoryId>{$row['categoryId']}</categoryId>\n";
    echo "<code>{$row['code']}</code>\n";
    echo "<barcode>{$row['barcode']}</barcode>\n";
    echo "<vendor>{$row['vendor']}</vendor>\n";
    echo "<name>{$row['name']}</name>\n";
    echo "<description>{$row['description']}</description>\n";
    echo "<url>{$row['url']}</url>\n";
    echo "<image>{$row['image']}</image>\n";
    echo "<priceRUAH>{$row['priceRUAH']}</priceRUAH>\n";
    echo "<priceRUSD>{$row['priceRUSD']}</priceRUSD>\n";
    echo "<stock>{$row['stock']}</stock>\n";
    echo "<delivery id=\"{$row['deliveryId']}\" cost=\"70\" freeFrom=\"5000\" />\n";
    echo "<guarantee type=\"{$row['guarantee_type']}\">{$row['guarantee_period']}</guarantee>\n";
    echo "<param name=\"Країна виготовлення\">Китай</param>\n";
    echo "<param name=\"Оригінальність\">Оригінал</param>\n";
    echo "<payment type=\"cash-on-delivery\" fee=\"2\">true</payment>\n";
    echo "<condition>0</condition>\n";
    echo "<shipping>1</shipping>\n";
    echo "<custom>1</custom>\n";
    echo "</item>\n";
}
echo "</items>\n";

echo "</price>";
$mysqli->close();
?>
