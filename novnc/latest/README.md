# noVnc

## Dockerfile内容

1. alpineベース
1. デフォルト環境変数設定
1. 環境構築用パッケージ取得
1. 時間をAsia/Tokyoに設定
1. 実行環境用パッケージ取得
1. noVNCをgitから取得
1. (必要なバージョンのwebsockify取得）
1. 不要ファイル削除
1. alpine（BusyBox/ash）用にバッチ書き換え
1. 実行シェル作成

### 起動ファイル

`/root/entry.sh`
``` bash
#!/bin/bash
/root/noVNC/utils/launch.sh --listen $PORT --vnc $VNC_HOST':'$VNC_PORT $@
```

## 使用方法

ex.)Raspberry PiのVNCサーバを起動した状態で別PCから接続

別PC　→　Docker noVNC　→　RaspberryPi VNCサーバ

``` bash
docker run --rm -it -e PORT=6080 -e VNC_HOST=HOSTNAME -p 6080:6080 coneyware/novnc
```

別PCのブラウザから
http://localhost:6080/vnc.html?host=localhost&port=6080
にアクセス

## 各tag説明

* latest
	+ python 3
	+ numpy　あり
	+ noVncのバージョン指定なし（master）
* v9.9.9
	+ python 3
	+ numpy　あり
	+ noVncのバージョン指定（tag:v9.9.9）
* v9.9.9-python2
	+ python 2
	+ numpy　あり
	+ noVncのバージョン指定（tag:v9.9.9）
* v9.9.9-min
	+ python 2
	+ numpy　__なし__
	+ noVncのバージョン指定（tag:v9.9.9）

## License

coneyware/novnc under [MIT](https://opensource.org/licenses/mit-license.php)

