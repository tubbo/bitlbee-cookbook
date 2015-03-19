# bitlbee cookbook

This cookbook installs and configures the Bitlbee IM/IRC gateway,
allowing one to chat over various IM services using their favorite IRC
client.

## Supported Platforms

- Ubuntu 14.10

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['bitlbee']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### bitlbee::default

Include `bitlbee` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[bitlbee::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
