rec {
  mainHue = 240;
  highlightHue = 345;

  bg0 = { h = mainHue; s = 0.5; v = 0.15; };
  bg1 = { h = mainHue; s = 0.5; v = 0.2; };
  bg2 = { h = mainHue; s = 0.5; v = 0.3; };
  bgMin = { h = mainHue; s = 0.3; v = 0.2; };
  urgent = { h = highlightHue; s = 0.7; v = 0.9; };

  fg1 = { h = 0; s = 0; v = 1; };
  fg2 = { h = 0; s = 0; v = 0.6; };
  fg3 = { h = 0; s = 0; v = 0.3; };
}
