# !/bin/bash

mdDir=../md/
htmlDir=../html/
cacheDir=../.cache/
backupDir=../.backup/

templates=../templates/
headPath=${templates}head.html
tailPath=${templates}tail.html
tempIndex=${templates}index.html

linkDir=./html/
line=27

cd ${mdDir}
cp ${mdDir}* ${backupDir}
rm ${cacheDir}*

# transfer .md to .html
for f in *.md; do
	# get rid of .md extension and append .html
	name=$(echo $f | sed 's/\.md$//')
	targetName=$(echo ${name}.html)

	# convert md to html (without head)  (to .cache dir)
	marked ${mdDir}${f} -o ${cacheDir}${targetName}

	# cat head.html and (cache).html to (targetName).html
	cat ${headPath} ${cacheDir}${targetName} ${tailPath}> ${htmlDir}${targetName}

	echo ${f} converted to ${targetName}.html

	# insert link to index.html
	sed "${line}i <a href=\"${linkDir}${targetName}\">${name}</a>" ${tempIndex} > ../index.html
done


