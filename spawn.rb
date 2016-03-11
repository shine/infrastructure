require 'dotenv'
require 'aws-sdk'
require 'pry'
Dotenv.load

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')
i = ec2.client.run_instances(
  image_id: "ami-d4f7ddbe", #Amazon Linux AMI 2015.09.2 (PV)
  min_count: 1,
  max_count: 1
)
puts "DB8: #{i.instances[0].instance_id}"
ec2.client.create_tags(
  {
    :resources => [ i.instances[0].instance_id ],
    :tags => [{:key => "role", :value => "samwecom"}]
  }
)

