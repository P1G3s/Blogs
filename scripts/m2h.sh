# !/bin/bash

mdDir=../md/
htmlDir=../html/
cacheDir=../.cache/
backupDir=../.backup/
headPath=../templates/head.html

cd ${mdDir}
cp ${mdDir}* ${backupDir}
rm ${cacheDir}*
# transfer .md to .html
for f in *.md; do
	# get rid of .md extension and append .html
	targetName=$(echo $f | sed 's/\.md$//')
	targetName=$(echo ${targetName}.html)

	# convert md to html (without head)  (to .cache dir)
	marked ${mdDir}${f} -o ${cacheDir}${targetName}

	# cat head.html and (cache).html to (targetName).html
	cat ${headPath} ${cacheDir}${targetName} > ${htmlDir}${targetName}

	echo ${f} converted to ${targetName}.html
done


