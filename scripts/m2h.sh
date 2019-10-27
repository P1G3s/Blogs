# !/bin/bash

mdDir=~/Documents/Blogs/md/
htmlDir=../html/
cacheDir=../.cache/
backupDir=../.backup/

templates=../templates/
headPath=${templates}head.html
tailPath=${templates}tail.html
tempIndex=${templates}index.html

linkDir=./html/
line=37

cd ${mdDir}
cp ${mdDir}* ${backupDir}
rm ${cacheDir}*
if [[ $(ls ../index.html) ]]; then
	mv ../index.html ../.cache
	cp ${tempIndex} ../
else 
	echo "create index.html"
	cp ${tempIndex} ../
fi

# transfer .md to .html
for f in *.md; do
	# get rid of .md extension and append .html
	name=$(echo $f | sed 's/\.md$//')
	targetName=$(echo ${name}.html)

	# convert md to html (without head)  (to .cache dir)
	marked ${mdDir}${f} -o ${cacheDir}${targetName}

	# cat head.html and (cache).html to (targetName).html
	cat ${headPath} ${cacheDir}${targetName} ${tailPath}> ${htmlDir}${targetName}

	echo ${f} converted to ${targetName}

	# insert link to index.html
	sed -i "${line}i - <a href=\"${linkDir}${targetName}\">${name}</a><br>" ../index.html
done


