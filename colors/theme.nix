rec {
  mainHue = 240;
  highlightHue = 345;

  bg0 = { h = mainHue; s = 0.5; v = 0.15; };
  bg1 = { h = mainHue; s = 0.5; v = 0.2; };
  bg2 = { h = mainHue; s = 0.5; v = 0.3; };
  bgMin = { h = mainHue; s = 0.3; v = 0.2; };

  hl1 = { h = highlightHue; s = 0.7; v = 0.9; };
  hl2 = { h = highlightHue; s = 0.5; v = 0.9; };
  hl3 = { h = highlightHue; s = 0.4; v = 0.9; };

  fg1 = { h = 0; s = 0; v = 1; };
  fg2 = { h = 0; s = 0; v = 0.6; };
  fg3 = { h = 0; s = 0; v = 0.3; };
}
