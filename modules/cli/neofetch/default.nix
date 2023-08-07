{ pkgs, ... }:

{
  home.packages = [ pkgs.neofetch ];
  home.file.".config/neofetch/config.conf".text = ''
    print_info() {
        info title
        info underline

        info "OS" distro
        info "Host" model
        info "Kernel" kernel
        info "Uptime" uptime
        info "Packages" packages
        info "Shell" shell
        info "Resolution" resolution
        info "WM" wm
        info "Theme" theme
        info "CPU" cpu
        info "GPU" gpu
        info "Memory" memory

        info "GPU Driver" gpu_driver  # Linux/macOS only
        info "Disk" disk
        info "Battery" battery
        info "Font" font

        info cols
    }

    # Title


    # Hide/Show Fully qualified domain name.
    #
    # Default:  'off'
    # Values:   'on', 'off'
    # Flag:     --title_fqdn
    title_fqdn="off"


    # Kernel


    # Shorten the output of the kernel function.
    #
    # Default:  'on'
    # Values:   'on', 'off'
    # Flag:     --kernel_shorthand
    # Supports: Everything except *BSDs (except PacBSD and PC-BSD)
    #
    # Example:
    # on:  '4.8.9-1-ARCH'
    # off: 'Linux 4.8.9-1-ARCH'
    kernel_shorthand="on"


    # Distro


    # Shorten the output of the distro function
    #
    # Default:  'off'
    # Values:   'on', 'tiny', 'off'
    # Flag:     --distro_shorthand
    # Supports: Everything except Windows and Haiku
    distro_shorthand="tiny"

    # Show/Hide OS Architecture.
    # Show 'x86_64', 'x86' and etc in 'Distro:' output.
    #
    # Default: 'on'
    # Values:  'on', 'off'
    # Flag:    --os_arch
    #
    # Example:
    # on:  'Arch Linux x86_64'
    # off: 'Arch Linux'
    os_arch="off"


    # Uptime


    # Shorten the output of the uptime function
    #
    # Default: 'on'
    # Values:  'on', 'tiny', 'off'
    # Flag:    --uptime_shorthand
    #
    # Example:
    # on:   '2 days, 10 hours, 3 mins'
    # tiny: '2d 10h 3m'
    # off:  '2 days, 10 hours, 3 minutes'
    uptime_shorthand="tiny"


    # Memory
    memory_percent="off"
    memory_unit="gib"


    # Packages
    package_managers="tiny"


    # Shell
    shell_path="off"
    shell_version="off"


    # CPU
    speed_type="bios_limit"
    speed_shorthand="on"
    cpu_brand="on"
    cpu_speed="off"
    cpu_cores="off"
    cpu_temp="off"


    # GPU
    gpu_brand="on"
    gpu_type="dedicated"
    refresh_rate="off"
    gtk_shorthand="on"
    gtk2="off"
    gtk3="off"


    # IP Address

    de_version="off"


    # Disk

    disk_show=('/')
    disk_subtitle="mount"
    disk_percent="on"


    # Song

    music_player="auto"
    song_format="%artist% - %album% - %title%"
    song_shorthand="on"
    mpc_args=()


    # Text Colors

    colors=(distro)


    # Text Options

    bold="on"
    underline_enabled="on"
    underline_char="-"
    separator=":"


    # Color Blocks

    block_range=(0 15)
    color_blocks="on"
    block_width=3
    block_height=1
    col_offset="auto"

    # Progress Bars

    bar_char_elapsed="-"
    bar_char_total="="
    bar_border="on"
    bar_length=15
    bar_color_elapsed="distro"
    bar_color_total="distro"

    memory_display="off"
    battery_display="off"
    disk_display="off"


    # Backend Settings


    # Image backend.
    #
    # Default:  'ascii'
    # Values:   'ascii', 'caca', 'catimg', 'chafa', 'jp2a', 'iterm2', 'off',
    #           'pot', 'termpix', 'pixterm', 'tycat', 'w3m', 'kitty', 'ueberzug',
    #           'viu'

    # Flag:     --backend
    image_backend="ascii"
    ascii_distro="NixOS_small"
    ascii_colors=(distro)
    ascii_bold="on"


    # Image Options

    image_loop="off"
    crop_mode="normal"
    crop_offset="center"
    image_size="auto"
    catimg_size="2"
    gap=3
    yoffset=0
    xoffset=0
    background_color=
    stdout="off"
  '';
}