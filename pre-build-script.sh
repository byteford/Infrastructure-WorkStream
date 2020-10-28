mkdir -p blogs
cd blogs

input="../blog_urls.txt"
while IFS= read -r line
do
  blogname=$(echo ${line##*/}|cut -f1 -d".")
  echo ${blogname}
  curl ${line} --output ${blogname}.txt
done < "$input"