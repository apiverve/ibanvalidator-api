Pod::Spec.new do |s|
  s.name             = 'APIVerveIBANValidator'
  s.version          = '1.2.3'
  s.summary          = 'IBAN Validator checks an IBAN\'s mod-97 checksum, its length and format for the country, and national check digits where the country...'
  s.description      = <<-'DESC'
IBAN Validator checks an IBAN's mod-97 checksum, its length and format for the country, and national check digits where the country defines them. It returns whether the IBAN is valid, the country and the reasons it fails. Paid plans add the bank code, branch code and account number, the correct check digits and the SEPA flag.

This iOS/macOS SDK provides a convenient way to access the IBAN Validator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/ibanvalidator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/ibanvalidator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveIBANValidator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
