{inputs, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = {
        color = "rgba(25, 20, 20, 1.0)";
        path = "${inputs.wallpapers}/Catppuccin/Macchiato/Kurzgesagt-Unknown_Lifeform.png";
      };
      label = [
        {
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$text";
          font_size = 90;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "$text";
          font_size = 25;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
      input-field = {
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$pink";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = "󰌾 Password...";
        hide_input = false;
        check_color = "$pink";
        fail_color = "$red";
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
