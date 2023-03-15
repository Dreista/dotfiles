local wezterm = require 'wezterm'

local is_windows = wezterm.target_triple == 'x86_64-pc-windows-msvc'

local launch_menu = {}
if is_windows then
    table.insert(launch_menu, {
        label = 'Windows PowerShell',
        args = {'powershell.exe'}
    })
    table.insert(launch_menu, {
        label = 'PowerShell',
        args = {os.getenv('USERPROFILE') .. '\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe'}
    })
end

return {
    color_scheme = "Dracula+",
    default_cursor_style = 'BlinkingUnderline',
    default_prog = is_windows and {os.getenv('USERPROFILE') .. '\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe'} or
        nil,
    enable_scroll_bar = true,
    font = wezterm.font_with_fallback {{
        family = 'Sarasa Term SC'
    }},
    font_size = 10.0,
    front_end = "WebGpu",
    initial_cols = 120,
    initial_rows = 30,
    launch_menu = launch_menu,
    native_macos_fullscreen_mode = true,
    webgpu_power_preference = "LowPower",
    window_background_opacity = 0.95,
    window_frame = {
        font = wezterm.font_with_fallback {{
            family = 'Sarasa UI SC'
        }}
    }
}
