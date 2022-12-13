{ ... }:

let
  colors = import ../../colors;
  base_dir = ".config/awesome/generated/";
in with colors; {
  home.file = {
    ${base_dir + "colors.lua"}.text = ''
      -- This file is autogenerated! Do not edit!

      return {
          bg1 = "${utils.hsvToHexP theme.bg1}",
          bg2 = "${utils.hsvToHexP theme.bg2}",
          bg_min = "${utils.hsvToHexP theme.bgMin}",

          urgent = "${utils.hsvToHexP theme.urgent}",

          fg1 = "${utils.hsvToHexP theme.fg1}",
          fg2 = "${utils.hsvToHexP theme.fg2}",
          fg3 = "${utils.hsvToHexP theme.fg3}",
      }
    '';
  };
}