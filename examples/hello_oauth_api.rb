require 'artoo/robot'

class BenderRobot < Artoo::Robot
  connection :loop
  device :passthru

  secure_api :host => '127.0.0.1', :port => '4321', :auth_host => '127.0.0.1', :auth_port => '3000', :application_id =>
 'bc9df009706b0d80a040ff283081f2e1',
  :secret =>
  '1287fe4ef3591d29f90afc56703f9616'

  work do
  	puts "Hello from the Secure API running at #{api_host}:#{api_port}..."
  end

  def beer
    "Gimmie beer!"
  end
end

robots = []
robots << BenderRobot.new(:name => "bender", :commands => [:beer])
BenderRobot.work!(robots)
