
echo "$(date) [INFO] do house keeping work start."
f_list=$(find ~/cputemp/data/ -mtime +30 -type f)
echo "$(date) [INFO] deleting the following files:"
echo "$f_list" | sort
echo $f_list | xargs rm -f
echo "$(date) [INFO] done."
