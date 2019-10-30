local M = {xoffset = 0, yoffset = 0, zoom = 1}

M.screen_to_world = function(action)
	return vmath.vector3(
	M.xoffset + action.screen_x / M.zoom,
	M.yoffset + action.screen_y / M.zoom, 0)
end

return M