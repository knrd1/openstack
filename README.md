# Working script:

    root@openstackcli:~/openstack# ./build.sh hello_world m1.medium
    1) create
    2) leave
    Choose option: 1
    Do you want to create new virtual machine? y/n: y
 
 
    Creating Virtual machine...
 
    +-----------------------------+---------------------------------------------------------+
    | Field                       | Value                                                   |
    +-----------------------------+---------------------------------------------------------+
    | OS-DCF:diskConfig           | MANUAL                                                  |
    | OS-EXT-AZ:availability_zone |                                                         |
    | OS-EXT-STS:power_state      | NOSTATE                                                 |
    | OS-EXT-STS:task_state       | scheduling                                              |
    | OS-EXT-STS:vm_state         | building                                                |
    | OS-SRV-USG:launched_at      | None                                                    |
    | OS-SRV-USG:terminated_at    | None                                                    |
    | accessIPv4                  |                                                         |
    | accessIPv6                  |                                                         |
    | addresses                   |                                                         |
    | adminPass                   | XXXXXXXXXXXX                                            |
    | config_drive                |                                                         |
    | created                     | 2018-02-13T02:56:12Z                                    |
    | flavor                      | m1.medium (3)                                           |
    | hostId                      |                                                         |
    | id                          | 3df53036-a35d-4919-888f-2139dbb6e9e0                    |
    | image                       | Ubuntu 16.04 LTS (2489bc76-937e-43ea-9480-87b098dc9286) |
    | key_name                    | konrad                                                  |
    | name                        | hello_world                                             |
    | progress                    | 0                                                       |
    | project_id                  | 32fb1de794e24ae6a6ace6059707d66a                        |
    | properties                  |                                                         |
    | security_groups             | name='f4556561-d023-4ff9-ae9e-88878db8a35b'             |
    | status                      | BUILD                                                   |
    | updated                     | 2018-02-13T02:56:12Z                                    |
    | user_id                     | d2a1654aabea4294a617d3f3f6092853                        |
    | volumes_attached            |                                                         |
    +-----------------------------+---------------------------------------------------------+
 
    Please associate floating IP via GUI and then paste IP here and press ENTER to continue: asdasd
    Please associate floating IP via GUI and then paste IP here and press ENTER to continue: 213123
    Please associate floating IP via GUI and then paste IP here and press ENTER to continue: 87.254.4.129
    Please associate floating IP via GUI and then paste IP here and press ENTER to continue: 87.254.4.129
 
    Floating IP assigned
 
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
    Configuring web applications, please wait...
 
    Web application is online: http://87.254.4.129
 
    Choose option: 
    1) create
    2) leave
    Choose option: 2
    Bye
 

# Notes:
Script "build.sh" comes with "userdata.sh" and "Konrad-openrc.sh" files. Please make sure all the files are all together in the same directory.

# Bugs:
When you manually assign floating IP via GUI and paste it too fast to the script (while STATE is "BUILDING"), you may need to repeat it - so wait for VM state "RUNNING" and paste IP again to the script.

# To do: 
1) Add features:
 a) Number of VMs,
 b) Environment.

# Cannot associate floating IP via CLi, works fine in GUI

    root@test:~# openstack server list
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    | ID                                   | Name | Status | Networks                       | Image            | Flavor   |
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    | 45641123-618d-4e84-8826-0ca8dcecdea0 | blog | ACTIVE | Default=10.0.0.3               | Ubuntu 16.04 LTS | m1.small |
    | 1d9c0006-0412-4185-9888-c56aafb7f492 | test | ACTIVE | Default=10.0.0.4, 87.254.4.129 | Ubuntu 16.04 LTS | m1.small |
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    root@test:~# openstack floating ip list
         +--------------------------------------+---------------------+------------------+--------------------------------------+-------------------------------------+----------------------------------+
     | ID                                   | Floating IP Address | Fixed IP Address | Port                                 | Floating Network                     | Project                          |
    +--------------------------------------+---------------------+------------------+--------------------------------------+--------------------------------------+----------------------------------+
    | 2533f3d6-2f11-49dc-b47b-eac57ce15d5c | 87.254.4.131        | None             | None                                 | 78c0dc1f-a6ae-4073-9764-db02c2970db3 | 32fb1de794e24ae6a6ace6059707d66a |
    | 6c9c64a4-f6e6-477b-84c8-79a6ca07451a | 87.254.4.129        | 10.0.0.4         | b39b8d37-8f47-4266-84a2-49f5956cab1d | 78c0dc1f-a6ae-4073-9764-db02c2970db3 | 32fb1de794e24ae6a6ace6059707d66a |
    | f67b0f52-df17-4410-aa85-0c574f2f6a3b | 87.254.4.128        | None             | None                                 | 78c0dc1f-a6ae-4073-9764-db02c2970db3 | 32fb1de794e24ae6a6ace6059707d66a |
    +--------------------------------------+---------------------+------------------+--------------------------------------+--------------------------------------+----------------------------------+
    root@test:~# openstack server add floating ip blog 87.254.4.131
    add_floating_ip
    root@test:~# openstack server list
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    | ID                                   | Name | Status | Networks                       | Image            | Flavor   |
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    | 45641123-618d-4e84-8826-0ca8dcecdea0 | blog | ACTIVE | Default=10.0.0.3               | Ubuntu 16.04 LTS | m1.small |
    | 1d9c0006-0412-4185-9888-c56aafb7f492 | test | ACTIVE | Default=10.0.0.4, 87.254.4.129 | Ubuntu 16.04 LTS | m1.small |
    +--------------------------------------+------+--------+--------------------------------+------------------+----------+
    root@test:~#

# FIXED:
```
root@openstackcli:~# openstack floating ip create 78c0dc1f-a6ae-4073-9764-db02c2970db3
+---------------------+--------------------------------------+
| Field               | Value                                |
+---------------------+--------------------------------------+
| created_at          | None                                 |
| description         | None                                 |
| fixed_ip_address    | None                                 |
| floating_ip_address | 87.254.4.147                         |
| floating_network_id | 78c0dc1f-a6ae-4073-9764-db02c2970db3 |
| id                  | 9f6f55b1-c20e-4490-9e50-ea4304febc94 |
| name                | 87.254.4.147                         |
| port_id             | None                                 |
| project_id          | 32fb1de794e24ae6a6ace6059707d66a     |
| qos_policy_id       | None                                 |
| revision_number     | None                                 |
| router_id           | None                                 |
| status              | ACTIVE                               |
| subnet_id           | None                                 |
| updated_at          | None                                 |
+---------------------+--------------------------------------+
root@openstackcli:~# openstack floating ip set --port 6b33aa4d-f688-4759-9d57-edc243012a9c 87.254.4.147
root@openstackcli:~# openstack server list
+--------------------------------------+--------------+--------+--------------------------------------------------------------------------+------------------+-----------+
| ID                                   | Name         | Status | Networks                                                                 | Image            | Flavor    |
+--------------------------------------+--------------+--------+--------------------------------------------------------------------------+------------------+-----------+
| e790b7d7-777d-464c-b5ad-4ae6e55c15fe | konrad       | ACTIVE | Default=10.0.0.5                                                         | Ubuntu 16.04 LTS | m1.small  |
| 2c6d729c-97ba-4c23-9282-126608a65387 | hello_world  | ACTIVE | Default=10.0.0.4, 87.254.4.144, 87.254.4.131, 87.254.4.129               | Ubuntu 16.04 LTS | m1.medium |
| 52bdf300-3079-471c-9522-427d7efaff51 | openstackcli | ACTIVE | Default=10.0.0.3, 87.254.4.147, 87.254.4.146, 87.254.4.145, 87.254.4.128 | Ubuntu 16.04 LTS | m1.small  |
+--------------------------------------+--------------+--------+--------------------------------------------------------------------------+------------------+-----------+
root@openstackcli:~#
```
