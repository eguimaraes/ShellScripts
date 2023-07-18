#https://learn.microsoft.com/en-us/azure/virtual-wan/certificates-point-to-site
$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=2023VPNMultConnect" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign


New-SelfSignedCertificate -Type Custom -DnsName "2023VPNMultConnect" -KeySpec Signature `
-Subject "CN=2023VPNMultConnect" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")
