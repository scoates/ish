with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "ish";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    (python37.withPackages (pypkgs: [ pypkgs.pip pypkgs.virtualenv ]))
    pipenv
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
