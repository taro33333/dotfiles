#!/bin/sh

# Golang packages
PACKAGES=$(
  cat <<EOF
golang.org/x/tools/cmd/goimports@latest
honnef.co/go/tools/cmd/staticcheck@latest
github.com/cweill/gotests/gotests@latest
mvdan.cc/gofumpt@latest
github.com/josharian/impl@latest
github.com/haya14busa/goplay/cmd/goplay@latest
golang.org/x/tools/gopls@latest
github.com/fatih/gomodifytags@latest
github.com/x-motemen/gore/cmd/gore@latest
github.com/mdempsky/gocode@latest
google.golang.org/protobuf/cmd/protoc-gen-go@latest
google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest
github.com/k1LoW/tbls@latest
github.com/bufbuild/buf/cmd/buf@latest
github.com/spf13/cobra-cli@latest
github.com/spf13/cobra@latest
EOF
)

echo "install golang packages..."
echo "$PACKAGES" | xargs -L 1 -P 4 go install

if type "asdf" >/dev/null 2>&1; then
  echo "reshim asdf golang"
  asdf reshim golang
fi
