When(/^I run spawn.rb$/) do
  `ruby spawn.rb`
end


Then(/^A cloud instance tagged samwecom should appear$/) do
   require 'aws-sdk-v1'
   require 'dotenv'
   require 'pry'
   Dotenv.load
   AWS.config(
     access_key_id: ENV['AWS_ACCESS_KEY'],
     secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
   )
   ec2 = AWS::EC2.new
   20.times do
     break if ec2.instances.filter("tag:role", "samwecom").select { |i| i.status == :running }.count == 1
     print "    sleep 1\n"
     sleep 1
   end
   expect( ec2.instances.filter("tag:role", "samwecom").select { |i| i.status == :running }.count ).to eq(1)
end
