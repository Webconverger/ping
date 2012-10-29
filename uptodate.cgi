#!/bin/bash


cat <<END
Cache-Control: no-cache
Content-Type: text/html


<head>
<title>Number of uptodate installs</title>
</head>
<h1 id="digit">
END
sha=$(git ls-remote git://github.com/Webconverger/webc.git refs/heads/master)
grep ${sha:0:6} debug.log | awk '{print $4}' | sort | uniq | wc -l
cat <<END
</h1>

<script>
window.onload = function () { document.getElementById('digit').style.fontSize = window.innerHeight + 'px'; };
</script>

END
