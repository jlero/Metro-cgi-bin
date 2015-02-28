#!/bin/bash

FIRST_DATE=`echo "$QUERY_STRING" | grep -oE "(^|[?&])first_date=[^&]+" | sed "s/+/ /g" | cut -f 2 -d "=" | head -n1`



	A=$(stat -c "%y" /home/admin2/ADBK/Base/_adbkDB_.db3)
	
        echo "Content-Type: text/html"
        echo
        echo "<HTML><BODY>"
	echo "<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>"
	#echo "<script>"
	#echo "function calculateSplitting() { function splitSum(sum) { var cup = [500, 200, 100, 50, 20, 10, 5, 2, 1]; var cur = sum; var res = ''; for (var i = 0; i < cup.length; i++) { var c = cup[i]; var div = cur/c >> 0; if (div != 0) { res += (div + 'x' + c + '  '); cur -= div*c; } } return res; } function fillSplitting() { \$('tr').each(function() { var sum = \$(\$('td', \$(this))[0]).text().match(/\d+/)[0]; \$(\$('td', \$(this))[1]).text(splitSum(sum)); }); } fillSplitting(); } \$(calculateSplitting);"
	#echo "</script>"
        echo "<CENTER>Lab6</CENTER>"
        echo "File creation time is: $A <br>"
	echo "$FIRST_DATE <br>"
	#echo "substr($FIRST_DATE,0,5)"
	#echo "Station id = $DROPDOWN, firsttime = $FIRST_DATE and secondtime= $((FIRST_DATE+aaa))  "
	#echo "$aaa"
	#ID2="_Study/Security/ADBK_dump20130225/adbk."${DROPDOWN}".12.rar"
	#echo $ID2
#wget -P /home/admin2/labs https://google.com.ph/
#	wget -P /home/admin2/labs ftp://student:student@77.47.130.173/_Study/Security/ADBK_dump20130225/adbk.n0305.12.rar 
	#wget -P /home/admin2/labs ftp://student:student@77.47.130.173/$ID2
echo "<br>"
	echo "<B>"
	echo "<table border="1">"
	#echo "<tr>"
	#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>Id ' ||ID, '</td><td>Year ' || substr(DateTime, 0, 5), '</td><td>Month ' || substr(DateTime, 5, 2), '</td><td>Day ' || substr(DateTime, 7, 2), '</td><td>CASSIRUE ' || CardNO, '</td><td>SUMMA INCASACII ' || (Amount /100) || ' grn' FROM events 	WHERE DateTime > '$FIRST_DATE' and DateTime < '$SECOND_DATE' and EventCode = '231' "
	#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>' || (Amount/100), 'grn</td><td></td></tr>'  FROM events WHERE DateTime >  '20100531195451' and DateTime < '20130601102325' and EventCode = '231' "
	#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>' || (Amount/100), 'grn</td><td></td></tr>'  FROM events WHERE DateTime >  '20100531195451' and DateTime < '20130601102325' and EventCode = '231' "
	
	echo "<tr>"
	echo "<td>Number of banknotes</td><td>Value</td>"
	echo "</tr>"
sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT '<tr><td>' || count(*), '</td><td>' ||(Amount/100), ' grn</td></tr>'  FROM events WHERE EventCode = '29' and DateTime(substr(DateTime,0,5)||'-'||substr(DateTime,5,2)||'-'||substr(DateTime,7,2)||' '||substr(DateTime,9,2)||':'||substr(DateTime,11,2)||':'||substr(DateTime,13,2)) BETWEEN datetime('$FIRST_DATE 03:00:00') AND datetime('$FIRST_DATE 03:00:00', '+1 day') Group BY Amount/100"

#BETWEEN datetime('substr($FIRST_DATE,0,5)||'-'||substr($FIRST_DATE,5,2)'-'||(substr($FIRST_DATE,7,2)) 03:00:00', '-1 day') AND datetime('substr($FIRST_DATE,0,5)||'-'||substr($FIRST_DATE,5,2)'-'||(substr($FIRST_DATE,7,2)) 03:00:00', '+1 day')
	#echo "</tr>"
	echo ""
	echo "</table>"	
#$FIRST_DATE +00000001000000
	      #20130518130319
		#20110519130319
		#and DateTime < '$((FIRST_DATE+aaa))'
	
	
	#sqlite3 /home/admin2/ADBK/Base/_adbkDB_.db3 "SELECT 'Id ' || ID, 'Transaction Value ' || TransactionValue, 'Year ' || substr(DateTime, 0, 5), 'Month ' || substr(DateTime, 5, 2), 'Day ' || substr(DateTime, 7, 2), 'Purse Value' || PurseValue, 'Bunker Amount ' || BunkerAmount FROM events WHERE DateTime > '20100531195451' and DateTime < '20100601102325' and EventCode = '35' "

echo "</B>"


        echo "</BODY></HTML>"
