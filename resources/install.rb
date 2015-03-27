actions :install, :remove

attribute :user,          kind_of: String,                  default: 'bitlbee'
attribute :port,          kind_of: Fixnum,                  default: 6667
attribute :protocols,     kind_of: Array,                   default: []
attribute :from_package,  kind_of: [TrueClass, FalseClass], default: false
