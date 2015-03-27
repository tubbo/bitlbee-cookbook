actions :install, default: true

attribute :user,          kind_of: String,  default: 'bitlbee'
attribute :port,          kind_of: Fixnum,  default: 6667
attribute :protocols,     kind_of: Array,   default: []
attribute :from,          kind_of: String,  default: 'package'
attribute :branch,        kind_of: String,  default: 'master'
