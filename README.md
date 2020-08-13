# qcow2build
diskimage-builder build qcow2

## install tool

```
apt-get update
apt-get install git
apt-get install qemu-utils
apt-get install realpath
apt-get install python-pip
pip install 'networkx==2.2'
pip install diskimage-builder
```

## clone project
```
git clone https://github.com/GuaKing/qcow2build.git
```

## chose one partition config file to use
```
cd qcow2build
ll */*/*/*yaml */*yaml
-rwxr--r-- 1 root root  716 Aug 13 16:15 diskimage_builder/elements/gua-partition/block-device-default.yaml*
-rwxr--r-- 1 root root  716 Aug 13 16:41 partitions-templet/block-device-default-3part.yaml*
-rwxr--r-- 1 root root 1140 Aug 13 16:47 partitions-templet/block-device-default-lvm.yaml*
-rwxr--r-- 1 root root  343 Aug 13 16:46 partitions-templet/block-device-default.yaml*
# chose 3part.yaml
cp partitions-templet/xxxx.yaml diskimage_builder/elements/gua-partition/block-device-default.yaml
```

## build
```
./build.sh
```


