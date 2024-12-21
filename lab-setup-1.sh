# Record start time
start_time=$(date +%s)

echo $start_time > timecheck.txt

echo "Lab started at: $(date)"

# Get a list of users with UID >= 1001
users_to_delete=$(awk -F: '$3 >= 1001 {print $1}' /etc/passwd)

# Loop through the list and delete each user
for user in $users_to_delete; do
  # Delete the user and their home directory
  userdel -r "$user"
  echo "Deleted user: $user"
done

groups_to_delete=$(awk -F: '$3 >= 1001 {print $1}' /etc/group)

for group in $groups_to_delete; do
  # Delete the group
  groupdel "$group"
  echo "Deleted group: $group"
done

#Creating Directory Structure 

rm -rf /root/Engineering 

mkdir -p /root/Engineering/{Mech,IT,Comp,Civil,Entc}/{First,Second,Third,Fourth}
touch /root/Engineering/{Mech,IT,Comp,Civil,Entc}/{First,Second,Third,Fourth}/Sub{1..10}.txt


# Get the process ID (PID) of the process 'cat /dev/zero'
pids=$(pgrep -f "cat /dev/zero")

# Check if there are any matching processes
if [ -n "$pids" ]; then
    # Loop through each PID and kill the process
    for pid in $pids; do
        #echo "Killing process with PID: $pid"
        kill -9 $pid
    done
fi

cat /dev/zero > /dev/null & 



exit 0


