#!/bin/bash

cat > roc.html << EOF

<html>
<title>RobRoc</title>
<body>
<script languague="javascript">
window.open('http://go.oclasrv.com/afu.php?id=1364720')
window.open('http://go.onclasrv.com/afu.php?id=1364721')
window.open('http://go.onclasrv.com/afu.php?id=1364722')
window.open('http://go.oclasrv.com/afu.php?id=1364723')
window.open('http://go.pub2srv.com/afu.php?id=1364724')
window.open('http://go.onclasrv.com/afu.php?id=1364725')
window.open('http://go.onclasrv.com/afu.php?zoneid=1364728')
window.open('http://go.oclaserver.com/afu.php?zoneid=1364729')
</script>
<h1>RobRoc</h1>
<hr>
Hi human, I'm bursting the rockets.
</body>
</html>

EOF

midori -i 5 &

RUN=1
until [ RUN = 1 ];
 do
# [ $(free -m | grep Mem | tr -s " " | cut -d " " -f4) -le 100 ] && sysctl -w v$
  MEM=`free -m | grep Mem | tr -s " " | cut -d " " -f4`
  if [ $MEM -le 100 ]; then
  sysctl -w vm.drop_caches=3
   killall midori
   sleep 3
   midori &
  fi
 sleep 1
 done
