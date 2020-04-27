#!/bin/bash
cp -f /schemaspy.properties .
cp -f /schema-meta.xml .
exec java -jar /usr/local/lib/schemaspy/schemaspy*.jar -dp $SCHEMASPY_DRIVERS -o $SCHEMASPY_OUTPUT "$@"
