mkdir -p blogs
cd blogs

input="../blog_urls.txt"
> blognames.txt

# while IFS= read -r line
# do
#   blogname=$(echo ${line##*/}|cut -f1 -d".")
#   curl ${line} --output ${blogname}.txt
#   echo ${blogname} >> blognames.txt
# done < "$input"

while IFS= read -r line
do
  size=$(curl -sI ${line} | awk '/Content-Length/{gsub("\\r", ""); print $2}')

  if [ ${size} -lt 5000 ]; then
    blogname=$(echo ${line##*/}|cut -f1 -d".")
    curl ${line} --output ${blogname}.txt
    echo ${blogname} >> blognames.txt
  fi
done < "$input"