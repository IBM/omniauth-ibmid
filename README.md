# OmniAuth IBMid

This is the OmniAuth stragegy for authenticaing to IBMid

## Installation

Add to your `Gemfile`:

```ruby
gem "omniauth-ibmid"
```

## Usage

```ruby
use OmniAuth::Builder do
  provider :ibmid, ENV["IBMID_OIDC_CLIENT_ID"], ENV["IBMID_OIDC_CLIENT_SECRET"]
end
```

## License

[MIT License](./LICENSE).
