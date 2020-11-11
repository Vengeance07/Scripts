BEGIN {
print "Working on /etc/passwd file"
} 
/root/ {
print $0 
} 
END {
print "Completed working on /etc/passwd file" 
}
