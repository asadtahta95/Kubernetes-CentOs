# Update packages
yum update -y

# Install Docker
# Add repo
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# remove podman dan buildah
dnf remove podman buildah
# Install packages Docker
dnf install docker-ce docker-ce-cli containerd.io
# Enable & start docker service
systemctl start docker.service
systemctl enable docker.service
# Run docker without root
usermod -aG docker $USER

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version

# Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
mkdir -p /usr/local/bin/
install minikube /usr/local/bin
minikube version
minikube start --driver=docker

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
