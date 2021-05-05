# EFB-Docker

镜像包含模块

- [EH Forwarder Bot](https://github.com/ehForwarderBot/ehForwarderBot)
- [Telegram Master](https://github.com/ehForwarderBot/efb-telegram-master)
- [QQ Slave](https://github.com/milkice233/efb-qq-slave)
- [QQ Plugin Mirai](https://github.com/milkice233/efb-qq-plugin-mirai)
- [efb-filter-middleware](https://github.com/xzsk2/efb-filter-middleware)

**此镜像不含Mirai，请使用 [Mirai-Docker](https://github.com/xzsk2/Mirai-Docker) 或自行搭建**

## 使用

1. 使用`efb-wizard`初始化配置文件

    ```bash
    docker run --rm -it --name="efb" -v $PWD/efb/config:/app/config xzsk2/efb-docker:latest efb-wizard
    ```

2. 新建`./efb/config/profiles/default/milkice.qq/config.yaml`，根据样例修改

    ```yaml
    Client: mirai
    mirai:
        qq: 123456789           # 这里换成登录的 QQ 号
        host: "127.0.0.1"       # Mirai HTTP API 监听地址，根据实际情况填写
        port: 8080              # Mirai HTTP API 监听端口，一般是 8080
        authKey: "xxxxxx" # 这里填入在配置 Mirai API HTTP 时生成的 authKey
    ```

3. 启动

    ```bash
    docker run -d --name="efb" -v $PWD/efb/config:/app/config xzsk2/efb-docker:latest
    ```

4. 更新，使用 [Watchtower](https://github.com/containrrr/watchtower)

    ```bash
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        containrrr/watchtower -c \
        --run-once \
        efb
    ```
