action :install do
  protocol_string = if @new_resource.protocols.any?
    @new_resource.protocols.join("\s")
  else
    nil
  end

  template '/etc/init/bitlbee.conf' do
    source 'bitlbee.conf.erb'
    variables \
      user: @new_resource.user,
      port: @new_resource.port,
      protocols: protocol_string

    notifies 'service[bitlbee]', :restart
  end

  action :create
end

action :remove do
  file '/etc/init/bitlbee.conf' do
    action :remove
  end
end
