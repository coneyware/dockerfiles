#!/bin/bash
cp /schemaspy.properties .
cp /schema-meta.xml .
exec java -jar /usr/local/lib/schemaspy/schemaspy*.jar -dp $SCHEMASPY_DRIVERS -o $SCHEMASPY_OUTPUT "$@"
