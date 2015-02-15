server.1mg.org Cookbook
=======================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - server.1mg.org needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### server.1mg.org::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['server.1mg.org']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### server.1mg.org::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `server.1mg.org` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[server.1mg.org]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors

Setup Servers
-------------------

```json
yum update -y
reboot
yum update -y
curl -L https://www.opscode.com/chef/install.sh | bash

mkdir -p /var/chef/cookbooks /tmp/chef-cache /var/chef/backups /etc/chef
vi /etc/chef/solo.rb

hostname server.1mg.org

cd /var/chef/
yum install git
git clone git@github.com:geoemon2k/cookbooks.git
cd cookbooks/
chef-solo -j 1mg.rb

chown -R uehata:staff /var/chef/cookbooks
chown -R uehata:users /var/chef/cookbooks
mv /var/chef/cookbooks /home/uehata/
ln -sf /home/uehata/cookbooks /var/chef/

for stage
yum install -y rubygems
gem install rake
gem install foodcritic
```
