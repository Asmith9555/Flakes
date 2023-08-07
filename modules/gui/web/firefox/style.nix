{
  programs.firefox.profiles.default.userChrome = ''
          /*================== SIDEBAR ==================*/
    #sidebar-box,
          .sidebar-panel[lwt-sidebar-brighttext] {
            background-color: var(--base_color1) !important;
          }

          /* The default sidebar width. */
          /* #sidebar-box { */
          /*   overflow: hidden!important; */
          /*   position: relative!important; */
          /*   transition: all 300ms!important; */
          /*   min-width: 60px !important; */
          /*   max-width: 60px !important; */
          /* } */

          /* The sidebar width when hovered. */
          /* #sidebar-box #sidebar,#sidebar-box:hover { */
          /*   transition: all 300ms!important; */
          /*   min-width: 60px !important; */
          /*   max-width: 200px !important; */
          /* } */


          /* only remove TST headers */
    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
            display: none; /* remove sidebar header */
            border-color: var(--base_color2) !important;
          }

          /*******************/
          .sidebar-splitter {
            /* display: none;  remove sidebar split line */
            min-width: 1px !important;
            max-width: 1px !important;
            border-color: var(--base_color2) !important;
          }

          /* remove top tabbar */
    #titlebar { visibility: collapse !important; }


          /*================== URL BAR ==================*/
    #urlbar .urlbar-input-box {
            text-align: center !important;
          }


          * {
          font-family: JetBrainsMono Nerd Font Mono !important;
          font-size: 12pt !important;
          }

          /* #nav-bar { visibility: collapse !important; } */
            /* hide horizontal tabs at the top of the window */
            #TabsToolbar > * {
              visibility: collapse;
            }

            /* hide navigation bar when it is not focused; use Ctrl+L to get focus */
            #main-window:not([customizing]) #navigator-toolbox:not(:focus-within):not(:hover) {
              margin-top: -45px;
            }
            #navigator-toolbox {
              transition: 0.2s margin-top ease-out;
            }
  '';
}
