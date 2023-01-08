{ ... }:

{
  home.keyboard = {
    options = [
      "ctrl:nocaps"
    ];
  };

  services.xcape = {
    enable = true;
    mapExpression = {
      Control_L = "Escape";
    };
  };
}
