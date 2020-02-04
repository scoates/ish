with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "ish";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python38
    ninja
    meson
    llvm
    lld
    clang
    sqlite
  ];
  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)
  '';
}
