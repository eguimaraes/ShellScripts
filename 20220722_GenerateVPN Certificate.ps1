#https://docs.microsoft.com/en-us/azure/virtual-wan/certificates-point-to-site
$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=Edvaldo" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign

New-SelfSignedCertificate -Type Custom -DnsName EdvaldoCert -KeySpec Signature `
-Subject "CN=EdvaldoCert" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

Get-ChildItem -Path "Cert:\CurrentUser\My"

$cert = Get-ChildItem -Path "Cert:\CurrentUser\My\<THUMBPRINT>"
