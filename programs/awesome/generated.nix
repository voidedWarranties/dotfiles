{ ... }:

let
  colors = import ../../colors;
  base_dir = ".config/awesome/generated/";

  export = color: name: "${name} = \"${colors.utils.hsvToHexP color}\",";
in with colors; {
  home.file = {
    ${base_dir + "colors.lua"}.text = ''
      -- This file is autogenerated! Do not edit!

      return {
          ${export theme.bg0 "bg0"}
          ${export theme.bg1 "bg1"}
          ${export theme.bg2 "bg2"}
          ${export theme.bgMin "bg_min"}

          ${export theme.hl1 "hl1"}
          ${export theme.hl2 "hl2"}
          ${export theme.hl3 "hl3"}

          ${export theme.fg1 "fg1"}
          ${export theme.fg2 "fg2"}
          ${export theme.fg3 "fg3"}
      }
    '';
  };
}
