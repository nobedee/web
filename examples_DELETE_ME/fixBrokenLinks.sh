#!/bin/bash

# Fix links where quoted.
_lineNumber=$(grep -n "&quot;\<a " out.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumber}s|(href=\")([^\"]*)(&quot;)|\1\2|g" out.dump

# Fix links followed by punctuations.
sed -i -E "s|(href=\"[^\"]*)([[:punct:]]+)(\">)([^\"]+)&quot;([[:punct:]]*)(</a>)|\1\3\4\6\"\5|g" out.dump
sed -i -E "s|(href=\"[^\"]*)([[:punct:]]+)(\">)([^\"]*)([[:punct:]]*)(</a>)|\1\3\4\6\5|g" out.dump

# Fix incomplete quoted http://, https://, and ftp://
# http
_lineNumberhttp=$(grep -n 'href="http://"' out.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"http://\">(http://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" out.dump
sed -i -E "${_lineNumberhttp}s|href=\"http://\)\">(http://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" out.dump
sed -i "${_lineNumberhttp}s|href=\"http://\"|href=\"javascript:void(0)\"|g" out.dump
sed -i "s|<a href=\"http:\">http://</a>|<a href=\"javascript:void(0)\">http://</a>|g" out.dump
sed -i "s|<a href=\"http:/\">http://</a>|<a href=\"javascript:void(0)\">http://</a>|g" out.dump
# https
_lineNumberhttp=$(grep -n 'href="https://"' out.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"https://\">(https://)(\))(</a>)|href=\"javascript:void(0)\">\1\3\2|g" out.dump
sed -i -E "${_lineNumberhttp}s|href=\"https://\)\">(https://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" out.dump
sed -i "${_lineNumberhttp}s|href=\"https://\"|href=\"javascript:void(0)\"|g" out.dump
sed -i "s|<a href=\"https:\">https://</a>|<a href=\"javascript:void(0)\">https://</a>|g" out.dump
sed -i "s|<a href=\"https:/\">https://</a>|<a href=\"javascript:void(0)\">https://</a>|g" out.dump
# ftp
_lineNumberftp=$(grep -n 'href="ftp://"' out.dump | cut -d ":" -f 1)
sed -i -E "${_lineNumberhttp}s|href=\"ftp://\">(ftp://)(\))(</a>)|href=\"javascript:void(0)\">\1\3\2|g" out.dump
sed -i -E "${_lineNumberhttp}s|href=\"ftp://\)\">(ftp://)(\))([[:punct:]])(</a>)|href=\"javascript:void(0)\">\1\4\2\3|g" out.dump
sed -i "${_lineNumberftp}s|href=\"ftp://\"|href=\"javascript:void(0)\"|g" out.dump
sed -i "s|<a href=\"ftp:\">ftp://</a>|<a href=\"javascript:void(0)\">ftp://</a>|g" out.dump
sed -i "s|<a href=\"ftp:/\">ftp://</a>|<a href=\"javascript:void(0)\">ftp://</a>|g" out.dump