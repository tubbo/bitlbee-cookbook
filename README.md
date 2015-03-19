# bitlbee cookbook

This cookbook installs and configures the Bitlbee IM/IRC gateway,
allowing one to chat over various IM services using their favorite IRC
client.

## Supported Platforms

- Ubuntu 14.10

## Usage

Install Bitlbee with our handy-dandy LWRP!

```ruby
bitlbee_install 'bitlbee' do
  from_package false
  user 'bitlbee'
  port 6667
  protocols %w(yahoo jabber)
end
```

## License and Authors

Author: Tom Scott (<tubbo@psychedeli.ca>)
