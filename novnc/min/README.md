# noVnc

## Dockerfile内容

1. alpineベース


### 起動ファイル

`/root/entry.sh`
``` bash
#!/bin/bash
cd /root/noVNC/utils
/root/noVNC/utils/launch.sh --listen $PORT --vnc $VNC_HOST':'$VNC_PORT $@
```

## 使用方法

numpyを入れていないので遅くなる。

``` bash
docker run --rm -it -e PORT=6080 -e VNC_HOST=HOSTNAME -p 6080:6080 coneyware/novnc
```

## License

coneyware/novnc under [MIT](https://opensource.org/licenses/mit-license.php)

