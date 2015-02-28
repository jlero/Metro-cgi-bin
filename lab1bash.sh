#!/bin/bash
ID=`echo "$QUERY_STRING" | grep -oE "(^|[?&])id=[^&]+" | sed "s/+/ /g" | cut -f 2 -d "=" | head -n1`
#ID=`echo "$QUERY_STRING" | grep -oE "(^|[?&])id=[^&]+" | sed "s/%20/ /g" | cut -f 2 -d "="`
DROPDOWN=`echo "$QUERY_STRING" | grep -oE "(^|[?&])dropdown=[A-Za-z0-9 ]+" | sed "s/%20/ /g" | cut -f 2 -d "="`


	A=$(stat -c "%y" /home/admin2/ADBK/Base/_adbkDB_.db3)
	
        echo "Content-Type: text/html"
        echo
        echo "<HTML><BODY>"
        echo "<CENTER>Lab1</CENTER>"
        echo "File creation time is: $A <br>"
	echo "Station id = $DROPDOWN and card number = $ID"
	ID2="_Study/Security/ADBK_dump20130225/adbk."${DROPDOWN}".12.rar"
	#echo $ID2
#wget -P /home/admin2/labs https://google.com.ph/
#	wget -P /home/admin2/labs ftp://student:student@77.47.130.173/_Study/Security/ADBK_dump20130225/adbk.n0305.12.rar 
	#wget -P /home/admin2/labs ftp://student:student@77.47.130.173/$ID2
echo "<br>"
	echo "<B>"
	echo "<table border="1">"
	echo "<tr>"
	echo "<td>Id</td><td>Transaction Value </td><td>Date</td><td>Purse Value</td><td>Bunker Amount</td>"
	echo "</tr>"
	sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>' ||ID, '</td><td>' || TransactionValue, '</td><td> ' || substr(DateTime, 0, 5),  substr(DateTime, 5, 2), substr(DateTime, 7, 2), '</td><td>' || PurseValue, '</td><td>' || BunkerAmount FROM events 	WHERE CardNO = '$ID' "
#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>Id ' ||ID, '</td><td>Transaction Value ' || TransactionValue, '</td><td>Year ' || substr(DateTime, 0, 5), '</td><td>Month ' || substr(DateTime, 5, 2), '</td><td>Day ' || substr(DateTime, 7, 2), '</td><td>Purse Value' || PurseValue, '</td><td>Bunker Amount ' || BunkerAmount FROM events 	WHERE CardNO = '$ID' "
	echo "</tr>"
	echo "</table>"	
	
	
	#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT 'Id ' || ID, 'Transaction Value ' || TransactionValue, 'Year ' || substr(DateTime, 0, 5), 'Month ' || substr(DateTime, 5, 2), 'Day ' || substr(DateTime, 7, 2), 'Purse Value' || PurseValue, 'Bunker Amount ' || BunkerAmount FROM events WHERE DateTime > '20100531195451' and DateTime < '20100601102325' and EventCode = '35' "

echo "</B>"


        echo "</BODY></HTML>"
