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

## custom a ubutun element with a special kernel version
You can also add kernel install in your custom element but it will install two kernel versions. The official ubuntu element and your custom element will install one for each.
You need to uninstall officail one or set you custom one for default in other script .
So we can use a local ubuntu element with our change in it , and use it  instead of official "ubuntu" in your diskbuild-image-create command.
```
clone https://opendev.org/openstack/diskimage-builder.git
cd diskimage-builder/diskimage_builder/elements
cp -r ubuntu  $YourELEMENTS_PATH
```

## rename unbuntu to ubuntu-xxx
```
# ll
drwxr-xr-x 2 root root 4096 Apr 29 06:39 gua-partition/
drwxr-xr-x 7 root root 4096 Apr 29 06:39 ubuntu-gua/

```

## change kernel version 
```
qcow2build/diskimage_builder/elements/ubuntu-gua/package-installs.yaml
# cat  `pwd`/package-installs.yaml
linux-image-5.4.0-39-generic:
linux-headers-5.4.0-39-generic:

```

## change ubuntu element in build.sh
```
disk-image-create --offline --image-size=25G -o output-image vm ubuntu     block-device-mbr devuser gua-partition
disk-image-create --offline --image-size=25G -o output-image vm ubuntu-gua block-device-mbr devuser gua-partition
```

## build
```
./build.sh
```


