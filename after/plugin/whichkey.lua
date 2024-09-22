local status, whichkey = pcall(require, "which-key")
if not status then
	return
end

whichkey.setup()

whichkey.add({
    { "<leader>c", desc = "[C]ode" },
    { "<leader>d", desc = "[D]ocument" },
    { "<leader>r", desc = "[R]ename" },
    { "<leader>s", desc = "[S]earch" },
    { "<leader>w", desc = "[W]orkspace" },
})
