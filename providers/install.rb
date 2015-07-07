action :install do

  case new_resource.from
  when :package
    package 'bitlbee'
  when :source
    source_location = ::File.join Chef::Config[:file_cache_path], 'bitlbee'

    include_recipe 'git'

    git source_location do
      repository new_resource.repository
      branch new_resource.branch
    end

    execute 'apt-get build-dep -y bitlbee' do
      only_if { new_resource.install_dependencies }
    end

    execute './configure && make && make install' do
      cwd source_location
    end
  else
    raise ArgumentError, "'from' must be :package or :source"
  end

  protocol_string = if new_resource.protocols.any?
    new_resource.protocols.join("\s")
  end

  directory '/etc/bitlbee'

  template '/etc/bitlbee/bitlbee.conf' do
    source 'bitlbee.conf.erb'
    cookbook 'bitlbee'
    variables(
      user: new_resource.user,
      port: new_resource.port,
      protocols: protocol_string
    )
    action :create
  end

  template '/etc/init.d/bitlbee' do
    source 'init.sh.erb'
    cookbook 'bitlbee'
    action :create
  end

  execute '/etc/init.d/bitlbee start'
end

action :remove do
  execute '/etc/init.d/bitlbee stop'

  execute 'apt-get -y remove bitlbee'

  file '/etc/bitlbee/bitlbee.conf' do
    action :remove
  end

  directory '/etc/bitlbee' do
    action :remove
  end
end
