{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
}:

let
  name = "liblc3";
  version = "1.1.2";
in
stdenv.mkDerivation {
  pname = name;
  version = version;

  src = fetchFromGitHub {
    owner = "google";
    repo = "liblc3";
    rev = "v${version}";
    sha256 = "sha256-OWuj68+YztIh/dPvwqjW7ch7Ph3aiEIDvO9rMkVIrQ8=";
  };

  outputs = [
    "out"
    "dev"
  ];

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "LC3 (Low Complexity Communication Codec) is an efficient low latency audio codec";
    homepage = "https://github.com/google/liblc3";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ jansol ];
  };
}
