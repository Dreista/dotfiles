local wezterm = require 'wezterm'

local is_windows = wezterm.target_triple == 'x86_64-pc-windows-msvc'
local is_macos = wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'aarch64-apple-darwin'

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

local ssh_domains = wezterm.default_ssh_domains()
if is_windows then
    for _, domain in ipairs(ssh_domains) do
        domain.ssh_option.identityagent = os.getenv('USERPROFILE') .. '\\wincrypt-wsl.sock'
    end
end

return {
    color_scheme = 'Dracula+',
    default_cursor_style = 'BlinkingUnderline',
    default_prog = is_windows and {os.getenv('USERPROFILE') .. '\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe'} or
        nil,
    enable_scroll_bar = true,
    font = wezterm.font_with_fallback {{
        family = 'Sarasa Term SC'
    }},
    font_size = is_macos and 12.0 or 10.0,
    front_end = 'WebGpu',
    initial_cols = 120,
    initial_rows = 30,
    launch_menu = launch_menu,
    macos_window_background_blur = 20,
    native_macos_fullscreen_mode = true,
    ssh_domains = ssh_domains,
    win32_system_backdrop = "Acrylic",
    window_background_opacity = 0.95,
    window_close_confirmation = is_macos and 'NeverPrompt' or 'AlwaysPrompt',
    window_decorations = 'TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW',
    window_frame = {
        font = wezterm.font_with_fallback {{
            family = 'Sarasa UI SC'
        }}
    }
}
