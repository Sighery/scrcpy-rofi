{ pkgs ? import <nixpkgs> { }, ... }:

let
  version = "0.1.0";
in

pkgs.stdenv.mkDerivation {
  pname = "scrcpy-rofi";
  version = version;

  src = ./.;
  propagatedBuildInputs = with pkgs; [
    bash
    rofi
    scrcpy
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp scrcpy-rofi $out/bin/
    chmod +x $out/bin/scrcpy-rofi
  '';

  meta = with pkgs.lib; {
    description = "A Rofi-based manager for scrcpy";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
