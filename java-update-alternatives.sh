#!/bin/bash
set -Eeuo pipefail

update-alternatives --install "/usr/bin/ControlPanel" "ControlPanel" "$JAVA_HOME/bin/ControlPanel" 1
update-alternatives --set ControlPanel $JAVA_HOME/bin/ControlPanel

update-alternatives --install "/usr/bin/appletviewer" "appletviewer" "$JAVA_HOME/bin/appletviewer" 1
update-alternatives --set appletviewer $JAVA_HOME/bin/appletviewer

update-alternatives --install "/bin/extcheck" "extcheck" "$JAVA_HOME/bin/extcheck" 1
update-alternatives --set extcheck $JAVA_HOME/bin/extcheck

update-alternatives --install "/bin/idlj" "idlj" "$JAVA_HOME/bin/idlj" 1
update-alternatives --set idlj $JAVA_HOME/bin/idlj

update-alternatives --install "/bin/jar" "jar" "$JAVA_HOME/bin/jar" 1
update-alternatives --set jar $JAVA_HOME/bin/jar

update-alternatives --install "/bin/jarsigner" "jarsigner" "$JAVA_HOME/bin/jarsigner" 1
update-alternatives --set jarsigner $JAVA_HOME/bin/jarsigner

update-alternatives --install "/bin/java" "java" "$JAVA_HOME/bin/java" 1
update-alternatives --set java $JAVA_HOME/bin/java

update-alternatives --install "/bin/javac" "javac" "$JAVA_HOME/bin/javac" 1
update-alternatives --set javac $JAVA_HOME/bin/javac

update-alternatives --install "/bin/javadoc" "javadoc" "$JAVA_HOME/bin/javadoc" 1
update-alternatives --set javadoc $JAVA_HOME/bin/javadoc

update-alternatives --install "/bin/javafxpackager" "javafxpackager" "$JAVA_HOME/bin/javafxpackager" 1
update-alternatives --set javafxpackager $JAVA_HOME/bin/javafxpackager

update-alternatives --install "/bin/javah" "javah" "$JAVA_HOME/bin/javah" 1
update-alternatives --set javah $JAVA_HOME/bin/javah

update-alternatives --install "/bin/javap" "javap" "$JAVA_HOME/bin/javap" 1
update-alternatives --set javap $JAVA_HOME/bin/javap

update-alternatives --install "/bin/javapackager" "javapackager" "$JAVA_HOME/bin/javapackager" 1
update-alternatives --set javapackager $JAVA_HOME/bin/javapackager

update-alternatives --install "/bin/javaws" "javaws" "$JAVA_HOME/bin/javaws" 1
update-alternatives --set javaws $JAVA_HOME/bin/javaws

update-alternatives --install "/bin/jcmd" "jcmd" "$JAVA_HOME/bin/jcmd" 1
update-alternatives --set jcmd $JAVA_HOME/bin/jcmd

update-alternatives --install "/bin/jconsole" "jconsole" "$JAVA_HOME/bin/jconsole" 1
update-alternatives --set jconsole $JAVA_HOME/bin/jconsole

update-alternatives --install "/bin/jcontrol" "jcontrol" "$JAVA_HOME/bin/jcontrol" 1
update-alternatives --set jcontrol $JAVA_HOME/bin/jcontrol

update-alternatives --install "/bin/jdb" "jdb" "$JAVA_HOME/bin/jdb" 1
update-alternatives --set jdb $JAVA_HOME/bin/jdb

update-alternatives --install "/bin/jdeps" "jdeps" "$JAVA_HOME/bin/jdeps" 1
update-alternatives --set jdeps $JAVA_HOME/bin/jdeps

update-alternatives --install "/lib/jexec" "jexec" "$JAVA_HOME/lib/jexec" 1
update-alternatives --set jexec $JAVA_HOME/lib/jexec

update-alternatives --install "/bin/jhat" "jhat" "$JAVA_HOME/bin/jhat" 1
update-alternatives --set jhat $JAVA_HOME/bin/jhat

update-alternatives --install "/bin/jinfo" "jinfo" "$JAVA_HOME/bin/jinfo" 1
update-alternatives --set jinfo $JAVA_HOME/bin/jinfo

update-alternatives --install "/bin/jjs" "jjs" "$JAVA_HOME/bin/jjs" 1
update-alternatives --set jjs $JAVA_HOME/bin/jjs

update-alternatives --install "/bin/jmap" "jmap" "$JAVA_HOME/bin/jmap" 1
update-alternatives --set jmap $JAVA_HOME/bin/jmap

update-alternatives --install "/bin/jmc" "jmc" "$JAVA_HOME/bin/jmc" 1
update-alternatives --set jmc $JAVA_HOME/bin/jmc

update-alternatives --install "/bin/jps" "jps" "$JAVA_HOME/bin/jps" 1
update-alternatives --set jps $JAVA_HOME/bin/jps

update-alternatives --install "/bin/jrunscript" "jrunscript" "$JAVA_HOME/bin/jrunscript" 1
update-alternatives --set jrunscript $JAVA_HOME/bin/jrunscript

update-alternatives --install "/bin/jsadebugd" "jsadebugd" "$JAVA_HOME/bin/jsadebugd" 1
update-alternatives --set jsadebugd $JAVA_HOME/bin/jsadebugd

update-alternatives --install "/bin/jstack" "jstack" "$JAVA_HOME/bin/jstack" 1
update-alternatives --set jstack $JAVA_HOME/bin/jstack

update-alternatives --install "/bin/jstat" "jstat" "$JAVA_HOME/bin/jstat" 1
update-alternatives --set jstat $JAVA_HOME/bin/jstat

update-alternatives --install "/bin/jstatd" "jstatd" "$JAVA_HOME/bin/jstatd" 1
update-alternatives --set jstatd $JAVA_HOME/bin/jstatd

update-alternatives --install "/bin/jvisualvm" "jvisualvm" "$JAVA_HOME/bin/jvisualvm" 1
update-alternatives --set jvisualvm $JAVA_HOME/bin/jvisualvm

update-alternatives --install "/bin/keytool" "keytool" "$JAVA_HOME/bin/keytool" 1
update-alternatives --set keytool $JAVA_HOME/bin/keytool

update-alternatives --install "/bin/native2ascii" "native2ascii" "$JAVA_HOME/bin/native2ascii" 1
update-alternatives --set native2ascii $JAVA_HOME/bin/native2ascii

update-alternatives --install "/bin/orbd" "orbd" "$JAVA_HOME/bin/orbd" 1
update-alternatives --set orbd $JAVA_HOME/bin/orbd

update-alternatives --install "/bin/pack200" "pack200" "$JAVA_HOME/bin/pack200" 1
update-alternatives --set pack200 $JAVA_HOME/bin/pack200

update-alternatives --install "/bin/rmic" "rmic" "$JAVA_HOME/bin/rmic" 1
update-alternatives --set rmic $JAVA_HOME/bin/rmic

update-alternatives --install "/bin/rmid" "rmid" "$JAVA_HOME/bin/rmid" 1
update-alternatives --set rmid $JAVA_HOME/bin/rmid

update-alternatives --install "/bin/rmiregistry" "rmiregistry" "$JAVA_HOME/bin/rmiregistry" 1
update-alternatives --set rmiregistry $JAVA_HOME/bin/rmiregistry

update-alternatives --install "/bin/schemagen" "schemagen" "$JAVA_HOME/bin/schemagen" 1
update-alternatives --set schemagen $JAVA_HOME/bin/schemagen

update-alternatives --install "/bin/serialver" "serialver" "$JAVA_HOME/bin/serialver" 1
update-alternatives --set serialver $JAVA_HOME/bin/serialver

update-alternatives --install "/bin/wsgen" "wsgen" "$JAVA_HOME/bin/wsgen" 1
update-alternatives --set wsgen $JAVA_HOME/bin/wsgen

update-alternatives --install "/bin/wsimport" "wsimport" "$JAVA_HOME/bin/wsimport" 1
update-alternatives --set wsimport $JAVA_HOME/bin/wsimport

update-alternatives --install "/bin/xjc" "xjc" "$JAVA_HOME/bin/xjc" 1
update-alternatives --set xjc $JAVA_HOME/bin/xjc

exec "$@"
