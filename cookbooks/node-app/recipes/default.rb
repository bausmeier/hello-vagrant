# Add the node repository to apt
apt_repository "nodejs" do
  uri "http://ppa.launchpad.net/chris-lea/node.js/ubuntu"
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C7917B12"
end

# Install node from apt
apt_package "nodejs" do
  action :install
end

# Install forever from npm
bash "install_forever" do
  code "npm install -g forever"
end

# Install app dependencies
bash "install_dependencies" do
  cwd "/vagrant"
  code "npm install"
end

# Start up the node server using forever
bash "start_node" do
  cwd "/vagrant"
  code "forever start app.js"
end

# Add a localhost site
cookbook_file "#{node['nginx']['dir']}/sites-available/localhost" do
  owner "root"
  group "root"
  mode "0644"
end

# Enable the localhost site
nginx_site "localhost" do
  enable true
end
