actions :install, :remove

attribute :user, kind: String, default: 'bitlbee'
attribute :port, kind: Fixnum, default: 6667
attribute :protocols, kind: Array, default: []
