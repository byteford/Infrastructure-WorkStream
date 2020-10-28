mkdir -p blogs
cd blogs

input="../blog_urls.txt"

blognames_file
while IFS= read -r line
do
  blogname=$(echo ${line##*/}|cut -f1 -d".")
  curl ${line} --output ${blogname}.txt
  echo ${blogname} >> blognames.txt
done < "$input"