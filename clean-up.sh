#!
# Killing containers which has label of "hkn"
docker kill $(docker ps -q --filter "label=hkn")
# Removing killed containers which have label of "hkn"
docker rm $(docker ps -q -a --filter "label=hkn" --filter status=exited)
# Prune Network bridges which are not used by any container
docker system prune -f  
docker network prune -f

docker volume prune -f
# Close running vms all
VBoxManage list runningvms | awk '{print $2;}' | xargs -I vmid VBoxManage controlvm vmid poweroff
## Unregister VMs ID
VBoxManage list vms | awk '{print $2;}' | xargs -I vmid VBoxManage unregistervm --delete vmid

rm -rf /root/VirtualBox\ VMs/*
# Cleanup previously imported VMDKs path
