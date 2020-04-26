# elixir_jp
[![](https://images.microbadger.com/badges/image/coneyware/elixir_jp.svg)](https://microbadger.com/images/coneyware/elixir_jp "Get your own image badge on microbadger.com")

## Dockerfile内容

1. erlang:alpineベース
1. localをAsia/Tokyoに設定
1. githubからelixir-langを取り込みコンパイル


### 注意事項

__起動アプリなし__

## iex起動サンプル

`docker run -it coneyware/elixir_jp iex`

## docker-composeサンプル

vsCodeの.devcontainerサンプルです。

``` yml
version: "3"
services:
  elixirjp:
      image: "coneyware/elixir_jp"
      container_name: "elixirjp"
      volumes:
          - .:/workspaces
      ports: 
          - "4000:4000"
          - "80:80"
      hostname: "elixirjp"
      networks:
          - elixir
            # alpine linux ... [sleep infinity]は持ってない
      command: sh -c 'while sleep 3600; do :; done'
```

## License

elixir_jp under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)

