dir=$(dirname $0)
export DIB_CLOUD_IMAGES=/ubuntu-image
export BASE_IMAGE_FILE=ubuntu-20.04-server-cloudimg-amd64.squashfs
export SHA256SUMS=/ubuntu-image/SHA256SUMS.ubuntu.focal.amd64
export DIB_IMAGE_CACHE=/temp/image_cache2
#export DIB_CLOUD_IMAGES=http://cloud-images-archive.ubuntu.com/releases/focal/release-20200428
#export BASE_IMAGE_FILE=ubuntu-20.04-server-cloudimg-amd64.squashfs
#export SHA256SUMS=http://cloud-images-archive.ubuntu.com/releases/focal/release-20200428/SHA256SUMS

export DIB_RELEASE=focal
export ELEMENTS_PATH=$dir/diskimage_builder/elements
export DIB_DISTRIBUTION_MIRROR=http://mirrors.aliyun.com/ubuntu
disk-image-create --offline --image-size=25G -o output.qcow vm ubuntu block-device-mbr  gua-partition

