# Update packages
sudo yum update -y

# Install Docker
# Add repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# remove podman dan buildah
sudo dnf remove podman buildah -y
# Install packages Docker
sudo dnf install docker-ce docker-ce-cli containerd.io -y
# Enable & start docker service
sudo systemctl start docker.service
sudo systemctl enable docker.service
# Run docker without root
sudo usermod -aG docker $USER

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudomv ./kubectl /usr/local/bin/kubectl
kubectl version

# Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube
sudo mkdir -p /usr/local/bin/
install minikube /usr/local/bin
minikube version
minikube start --driver=docker

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
./get_helm.sh
