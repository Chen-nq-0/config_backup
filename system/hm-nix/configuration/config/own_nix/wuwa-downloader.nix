{
  lib,
  fetchFromGitHub,
  rustPlatform,
  openssl,
  pkg-config,
  fenix,
}:

let
  # 修复：使用 .toolchain 获取实际工具链，而不是属性集合
  rustToolchain = fenix.default.toolchain;
in
rustPlatform.buildRustPackage {
  pname = "wuwa-downloader";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "yuhkix";
    repo = "wuwa-downloader";
    rev = "2223c4493fc4ddeaa7182d4a9375e5ee55d5208a";
    sha256 = "sha256-Go2MBd3Xw+J5yLb73QGpCGIkk5FaRHg4dheP/gUgWB4=";
  };

  cargoHash = "sha256-yzi8ORqAET9VdWMWZiAIKzoFtN/fpr9rMsmH/nOs6vs="; # 占位符

  nativeBuildInputs = [
    pkg-config
    rustToolchain # 将工具链添加到构建输入
  ];

  buildInputs = [
    openssl
  ];

  # 这些环境变量可以省略，rustPlatform 会自动处理
  # 但如果需要明确指定，应该使用 rustToolchain 中的组件
  RUSTC = "${rustToolchain}/bin/rustc";
  CARGO = "${rustToolchain}/bin/cargo";

  meta = with lib; {
    description = "Rust-powered Wuthering Waves downloader with multi-CDN support";
    homepage = "https://github.com/yuhkix/wuwa-downloader";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
    mainProgram = "wuwa-downloader";
  };
}
