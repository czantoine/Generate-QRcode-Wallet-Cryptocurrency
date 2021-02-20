#!/bin/bash

number_list=$(wc -l list.txt )
number_list_clear=$(sed -n '$=' list.txt)

ext=0

while [ "$ext" = 0 ]; do

	echo "$number_list_clear cryptocurency have been detected on your list"
	echo "1. generate js code"
	echo "2. generate html code"
	echo "3. generate css code"
	echo "4. credit"
	echo "0. exit"
	echo "Enter a number"
	read choice
	echo ""

	if [[ $choice -eq 1 ]]
	then
		while IFS=, read -r list ; do
			echo -e 'let' "$list" = '"";' >> fichier.js
		done < list.txt
		echo "file js  have been generate !"
		echo ""
	elif [[ $choice -eq 2 ]]
		then
			while IFS=, read -r list ; do
				echo '<div id="'"$list"'"></div>' >> code_html
				echo '<script type="text/javascript">' >> code_html
				echo 'if ('"$list"' == "") {' >> code_html
				echo '}' >> code_html
				echo 'else{' >> code_html
				echo -e '\tdocument.getElementById('"'""$list""'"').innerHTML = '"'"'<img src="https://api.qrserver.com/v1/create-qr-code/?data='"'"' +' "$list" '+ '"'"'&amp;size=100x100""  title="'"$list"'" /> <h3>'"$list"'</h3>'"'"';' >> code_html
				echo '}' >> code_html
				echo '</script>' >> code_html
				echo "" >> code_html
			done < list.txt
			echo "code html have been generate !"
			echo ""
		elif [[ $choice -eq 3 ]]
			then
				while IFS=, read -r list ; do
					echo -e '#'"$list" '{' >> code_css
					echo -e '\tdisplay: inline-block;' >> code_css
					echo -e '}' >> code_css
					echo ""
				done < list.txt
				echo "code css have been generate !"
				echo ""
			elif [[ $choice -eq 4 ]]
				then
					echo "https://github.com/czantoine/Generate-QRcode-Wallet-Cryptocurrency"
					echo "MIT license"
				else
					exit 1;
				fi
			done
