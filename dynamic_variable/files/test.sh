cat /etc/passwd | awk -F":" '{if(/\/bin\/bash/) {print}}' | wc -l
