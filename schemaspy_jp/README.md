[github](https://github.com/coneyware/dockerfiles/tree/master/schemaspy_jp)
[dockerhub](https://hub.docker.com/r/coneyware/schemaspy_jp)

## schemaspy/schemaspyとの違い

* fontに[IPAフォント](https://ipafont.ipa.go.jp/old/ipafont/download.html)準備
	+ graphvizでER図を書くときの日本語テーブル対応
* JDBCドライバ全部なし

## Dockerfile内容

1. openjdk:8-jre-alpineベース
1. localをAsia/Tokyoに設定
1. 必要なフォルダ作成
1. schemaspyをgithubから取り込み
1. 起動ファイル指定

### 起動ファイル

`/home/schemaspy/schemaspy.sh`
``` bash
#!/bin/bash
cp -f /schemaspy.properties .
cp -f /schema-meta.xml .
exec java -jar /usr/local/lib/schemaspy/schemaspy*.jar -dp $SCHEMASPY_DRIVERS -o $SCHEMASPY_OUTPUT "$@"
```

## 使用方法

基本的に[schemaspy](https://hub.docker.com/r/schemaspy/schemaspy)と同じ
__必要なJDBCドライバを用意すること。__

### docker-composeサンプル

``` yml
version: "3"
services:
  schemaspy_jp:
      image: "coneyware/schemaspy_jp"
      container_name: "schemaspy_jp"
      hostname: "schemaspy"
      # ホストのネットワークに接続
      network_mode: "host"
      volumes:
          - "path/to/output:/output"
          - "path/to/drivers:/drivers"
          - "path/to/schemaspy.properties:/schemaspy.properties"
```

### oracleの注意点

12以降ではPDBにSIDでデフォルトで接続できない
``` listener.ora
# listener.ora SID接続設定
SID_LIST_LISTENER =
 (SID_LIST =
  (SID_DESC =
    (SID_NAME = SID_NAME)
    (ORACLE_HOME = /opt/oracle/product/12.1.0.2/dbhome_1)
    (GLOBAL_DBNAME = SID_NAME)
  )
 )

SE_SID_AS_SERVICE_listener=ON
```

## License

schemaspy_jp under [LGPL version 3](https://www.gnu.org/licenses/lgpl-3.0.ja.html) and [GPL version 3](https://www.gnu.org/licenses/gpl-3.0.html)

