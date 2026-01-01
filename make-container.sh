docker run -d \
  --name=superwebtop \
  --security-opt seccomp=unconfined \
  -e TZ=America/Chicago \
  -p 3042:3000 \
  -p 3043:3001 \
  -p 47949:47989 \
  -p 47984-47990:47984-47990/tcp \
  -p 47984-47990:47984-47990/udp \
  -p 48010:48010 \
  --gpus all \
  --restart unless-stopped \
  -v "/media/devmon/External 8TB:/mnt/8tb" \
  -v /mnt/4tb_Internal:/mnt/4tb \
  -v /mnt/remote_sftp:/mnt/remote_storage \
  my-gpu-desktop
