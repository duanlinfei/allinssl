# 配置~/.zshrc
```bash
# GO
GOROOT=/opt/go
GOPATH=/data/go
GOPROXY=https://goproxy.cn
export GOROOT GOPATH GOPROXY
export PATH=$GOROOT/bin:$PATH
```

# build
```bash
go mod tidy
go build -o output/allinssl cmd/main.go
go build -o output/plugins/aliyun plugins/aliyun/main.go plugins/aliyun/action.go

./allinssl 4 # 修改安全入口
./allinssl 5 # 修改用户名
./allinssl 6 # 修改密码
./allinssl 7 # 修改端口
./allinssl 15 # 获取面板地址
./allinssl start # 启动

# docker支持
docker build -t allinssl:v1 .

docker run -itd \
  --restart always \
  --name allinssl \
  -p 7979:8888 \
  -v /data/go/allinssl/output:/www/allinssl \
  -e ALLINSSL_USER=allinssl \
  -e ALLINSSL_PWD=allinssldocker \
  -e ALLINSSL_URL=allinssl \
  allinssl:v1
```

# 配置aliyun插件
```bash
# 授权API
{
  "access_key": "",
  "secret_key": "",
  "endpoint": "cas.aliyuncs.com"
}

# 部署参数, name=name+cert.md5后6位
{
  "name": "cert-"
}
```