#!/bin/bash

# Set to 1 if special characters and 0 if none.
_hasOptWithSpecialChar=1

_defaultSpecialChar=("-\`" "-backtick" "-\~" "-tilde" "-\!" "-explamation-mark" "-\@" "-aperand" "-\&\#35;" "-hash" "-\$" "-dollar-sign" "-\%" "-percent-sign" "-^" "-caret" "-\&amp;" "-ampersand" "-\*" "-asterisk" "-(" "-open-parenthesis" "-)" "-close-parenthesis" "--" "-dash" "-=" "-equal-sign" "-\[" "-open-bracket" "-\]" "-close-bracket" "-{" "-open-curly" "-}" "-close-curly" "-\;" "-semicolon" "-\:" "-colon" "-\&\#39;" "-single-quote" "-\|" "-vertical-bar" "-\&lt;" "-less-than" "-\&gt;" "-greater-than" "-," "-comma" "-\." "-period" "-\/" "-slash" "-?" "-question-mark")

if [ $_hasOptWithSpecialChar -eq 1 ]
then
  _length=${#_defaultSpecialChar[@]}
  for ((i = 0; i<_length; i+=2))
  do
    _curElement=${_defaultSpecialChar[i]}
    _replaceWith=${_defaultSpecialChar[i+1]}
    sed -i "s|<a name=\"-\"></a><span class=\"nroffip\">$_curElement|<a name=\"$_replaceWith\"></a><span class=\"nroffip\">$_curElement|g" out.dump
    sed -i "s|<a class=\"emphasis\" href=\"#-\">$_curElement|<a class=\"emphasis\" href=\"#$_replaceWith\">$_curElement|g" out.dump
  done
fi

# Fix hash special character
sed -i -E "s|<span Class=\"emphasis\">-\&\#35;([^.]*)</span>|<a class=\"emphasis\" href=\"#-hash\">-\&#35; \1</a>|g" out.dump
sed -i -E "s|<span Class=\"emphasis\">-\&lt;([^.]*)</span>|<a class=\"emphasis\" href=\"#-less-than\">-\&lt; \1</a>|g" out.dump
sed -i -E "s|<span Class=\"emphasis\">-\&gt;([^.]*)</span>|<a class=\"emphasis\" href=\"#-greater-than\">-\&gt; \1</a>|g" out.dump
sed -i -E "s|<span Class=\"emphasis\">-\&amp;([^.]*)</span>|<a class=\"emphasis\" href=\"#-ampersand\">-\&amp; \1</a>|g" out.dump
sed -i -E "s|<span Class=\"emphasis\">-\&\#39;([^.]*)</span>|<a class=\"emphasis\" href=\"#-single-quote\">-\&\#39; \1</a>|g" out.dump
