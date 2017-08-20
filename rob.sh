#!/bin/bash

cat > roc.html << EOF

<html>
<title>RobRoc</title>
<body>
<script languague="javascript">
window.open('http://coginator.com/Xrl')
window.open('http://coginator.com/X9E')
window.open('http://adf.ly/17715467/luw.servehttp.com')
window.open('http://adf.ly/17715467/banner/luw.servehttp.com')
</script>
<h1>RobRoc</h1>
<hr>
Hi human, I'm bursting the rockets.
</body>
</html>

EOF

RUN=1
until [ RUN = 1 ];
 do
  /etc/init.d/tor restart
# [ $(free -m | grep Mem | tr -s " " | cut -d " " -f4) -le 100 ] && sysctl -w v$
  MEM=`free -m | grep Mem | tr -s " " | cut -d " " -f4`
  if [ $MEM -le 100 ]; then
  sysctl -w vm.drop_caches=3
   killall midori
   sleep 3
   midori &
  fi
 midori &
 sleep 15
 killall midori
 done
