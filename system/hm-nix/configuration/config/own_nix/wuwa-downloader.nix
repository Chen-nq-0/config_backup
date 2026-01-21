{
  lib,
  fetchFromGitHub,
  rustPlatform,
  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage {
  pname = "wuwa-downloader";
  version = "0.21";

  src = fetchFromGitHub {
    owner = "yuhkix";
    repo = "wuwa-downloader";
    rev = "2223c4493fc4ddeaa7182d4a9375e5ee55d5208a";
    sha256 = "sha256-Go2MBd3Xw+J5yLb73QGpCGIkk5FaRHg4dheP/gUgWB4=";
  };

  cargoHash = "sha256-yzi8ORqAET9VdWMWZiAIKzoFtN/fpr9rMsmH/nOs6vs=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  meta = with lib; {
    description = "Rust-powered Wuthering Waves downloader with multi-CDN support";
    homepage = "https://github.com/yuhkix/wuwa-downloader";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
    mainProgram = "wuwa-downloader";
  };
}
