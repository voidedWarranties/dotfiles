# this is stupid. never do this.
let
  mod = a: b: (a - builtins.floor (a / b) * b);
  abs = a: (if a < 0 then -a else a);
  round = a: (if a - builtins.floor a < 0.5 then builtins.floor a else builtins.ceil a);

  byteToHex = byte:
    let
      chars = ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f"];

      place16 = byte / 16;
      place1 = mod byte 16;
    in
      builtins.elemAt chars place16 + builtins.elemAt chars place1;
in rec {
  # H is in degrees, S and V between 0.0 and 1.0
  # https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_RGB
  hsvToRgb = { h, s, v }:
    let
      C = v * s;
      Hp = h / 60.0;
      X = C * (1.0 - abs ((mod Hp 2.0) - 1.0));
      m = v - C;
    in
      if Hp >= 0 && Hp < 1 then
        { r = C + m; g = X + m; b = m; }
      else if Hp >= 1 && Hp < 2 then
        { r = X + m; g = C + m; b = m; }
      else if Hp >= 2 && Hp < 3 then
        { r = m; g = C + m; b = X + m; }
      else if Hp >= 3 && Hp < 4 then
        { r = m; g = X + m; b = C + m; }
      else if Hp >= 4 && Hp < 5 then
        { r = X + m; g = m; b = C + m; }
      else
        { r = C + m; g = m; b = X + m; };

  rgbToHex = { r, g, b }:
    let
      rB = round (r * 255.0);
      gB = round (g * 255.0);
      bB = round (b * 255.0);
    in
      byteToHex rB + byteToHex gB + byteToHex bB;

  hsvToHex = color: rgbToHex (hsvToRgb color);
  hsvToHexP = color: "#" + hsvToHex color; # p for pound
}
