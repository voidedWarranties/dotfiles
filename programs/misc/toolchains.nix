{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C++
    clang
    scons
    gnumake
    cmake

    # Rust
    rustup

    # Debugger
    lldb
  ];
}
