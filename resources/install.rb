actions :install, default: true
default_action :install

attribute :user,          kind_of: String,  default: 'bitlbee'
attribute :port,          kind_of: Fixnum,  default: 6667
attribute :protocols,     kind_of: Array,   default: []
attribute :from,          kind_of: Symbol,  default: :package
attribute :branch,        kind_of: String,  default: 'master'
attribute :repository,    kind_of: String,  default: 'https://github.com/bitlbee/bitlbee.git'
