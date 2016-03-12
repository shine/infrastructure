# todo
# this script should do the opposite of spawn.rb
# it should stop the instance tagged samwecom

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

running_instance = ec2.instances.detect{|i| i.tags["role"] && i.tags["role"] == "samwecom"} # role name samwecom should be moved to configuration file when we will have config here
ec2.client.stop_instances({instance_ids: [running_instance.instance_id]})
