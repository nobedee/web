# TEST CASES
[click](FORMAT.md#1)
There are 4 rules in "Makefile", and they are targeted numerically (i.e. make 1).
1. Full man page as rendered with curl build.
2. Full but edited man page from curl build where man pages edited are:
   - ftp-port.d
     - resolves [1](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Duplicate anchor](https://github.com/curl/curl/issues/11381#da)
   - proto.d
     - resolves [1](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Unwanted link](https://github.com/curl/curl/issues/11381#ul)
   - page-footer
     - resolves [2](https://github.com/bagder/roffit/issues/36) and [curl #11381 - Unwanted link](https://github.com/curl/curl/issues/11381#ul)
3. Condensed man pages per items listed in

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<hr>

| Issue ID | Section | Rendered HTML | Suggested Edit |
| --- | --- | --- | --- |
| Unwanted link | [Link to Section](https://curl.se/docs/manpage.html#--proto) <hr> ```--proto <protocols> ``` Examples <br><strong>A. Modifier list </strong>(3 occurences): <br> 1. \[x\] is + \| - \| = <br> <strong>B. Modifer list examples</strong>(3 occurences): <br> \[x\] is --proto and \[y\] -ftps \| -all,https,+http \| [y]=http,https | \<p class="level2"\>\<a class="bold" href="#-[\x]"\>\[x\] \[y]\</a\> \[z\]..\</p\> | IP p.level2 \\n .SH \[x\] => IP p.level2 |
| <div id="1"></div> Unwanted link | [Link to Instance](https://curl.se/docs/manpage.html#-x) <hr> \( ``` http:// ```\) <br> \( ``` ftp:// ``` \) <br>**[1](https://curl.se/docs/manpage.html#-x)**. -x, --proxy - 10th paragraph <br> **[2](https://curl.se/docs/manpage.html#--url)**.  --url <url> - 2nd paragraph <br> | \<p class="level1"\>..\<br\>(\<a href="http://)"\>http://)\</a\> ..\</p\> \| \<br\>"\<a href="http://&quot;"\>http://"\</a\> \| \<br\> "\<a href="ftp://&quot;"\>ftp://"\</a\> \| \<br\> \<a class="emphasis" href="#--proto-default"\>--proto-default\</a\> ..\</p\> | escape characters for http and ftp |
| Unwanted link | [Link to Section](https://curl.se/docs/manpage.html#NOPROXY) <hr> ``` NO_PROXY <comma-separated list of hosts/domains>``` <br> Environment - variables - NO_PROXY \(4 occurrences\) - <br>http:\/\/\[url]\ | \<span class="bold">\<a href="http:\/\/sub.doman.com">http:\/\/sub.domain.com\</a>\</span> | escape characters for http |
