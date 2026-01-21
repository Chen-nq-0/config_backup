{
  lib,
  fetchFromGitHub,
  python3,
  nix-update-script,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "wutheringwaves-cli-manager";
  version = "2.0.6"; # 请替换为实际版本号

  src = fetchFromGitHub {
    owner = "timetetng";
    repo = "wutheringwaves-cli-manager";
    rev = "v${version}"; # 或使用具体的commit hash
    hash = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="; # 使用nix-prefetch-github获取
  };

  # 如果项目使用pyproject.toml和uv
  nativeBuildInputs = with python3.pkgs; [
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    # 根据实际依赖添加
    click
    requests
    pyyaml
    # 其他依赖...
  ];

  # 如果项目使用requirements.txt
  # requirements = ./requirements.nix;  # 需要先用pip2nix生成

  pythonImportsCheck = [ "ww_cli" ]; # 根据实际模块名修改

  meta = with lib; {
    description = "《鸣潮》命令行CLI管理器，包含下载、管理、更新以及多服切换等功能";
    homepage = "https://github.com/timetetng/wutheringwaves-cli-manager";
    license = licenses.mit; # 根据实际许可证修改
    maintainers = with maintainers; [ ]; # 添加你的maintainer信息
    mainProgram = "ww";
  };
}
