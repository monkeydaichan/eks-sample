#/bin/sh

echo 'Installing kubectx'
brew install kubectx

echo 'Installing heptio-authenticator-aws'
wget -O /usr/local/bin/heptio-authenticator-aws https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/darwin/amd64/heptio-authenticator-aws

chmod +x /usr/local/bin/heptio-authenticator-aws

echo 'INSTALL TOOLS SUCCEEDED!!!'