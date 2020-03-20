kill -9 $(ps -auxfww| grep virtual | awk '{print $2}')
