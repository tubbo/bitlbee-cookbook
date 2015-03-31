action :install do

  case @new_resource.from
  when :package
    package 'bitlbee'
  when :source
    source_location = ::File.join Chef::Config[:file_cache_path], 'bitlbee'

    service 'bitlbee' do
      action :enable
    end

    git source_location do
      repository @new_resource.repository
      branch @new_resource.branch
    end

    execute 'apt-get build-dep -y bitlbee' do
      only_if { @new_resource.install_dependencies }
    end

    execute './configure && make && make install' do
      cwd source_location
      notifies :restart, 'service[bitlbee]'
    end
  else
    raise ArgumentError, "'from' must be :package or :source"
  end

  protocol_string = if @new_resource.protocols.any?
    @new_resource.protocols.join("\s")
  end

  template '/etc/init/bitlbee.conf' do
    source 'bitlbee.conf.erb'
    variables(
      user: @new_resource.user,
      port: @new_resource.port,
      protocols: protocol_string
    )

    notifies 'service[bitlbee]', :restart
    action :create
  end
end

action :remove do
  file '/etc/init/bitlbee.conf' do
    action :remove
  end
end
