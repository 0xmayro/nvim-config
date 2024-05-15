---@diagnostic disable: undefined-global

-- taken from https://www.gnu.org/licenses/gpl-howto.html
return {
	s(
		'gpll',
		fmt(
			[[
			This file is part of {program}.
			{program} is free software: 
			you can redistribute it and/or modify it under the terms of the GNU General Public License 
			as published by the Free Software Foundation, either version 3 of the License, 
			or (at your option) any later version.
				 
			{program} is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
			without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
			See the GNU General Public License for more details.
				 
			You should have received a copy of the GNU General Public License along with Foobar. 
			If not, see <https://www.gnu.org/licenses/>. 
	]],
			{
				program = f(function()
					local current_path = vim.fn.expand('%:p:h')
					while current_path:match('/src$') or current_path:match('/src/') do
						local parent_path = vim.fn.fnamemodify(current_path, ':h')
						if parent_path == current_path or parent_path == '' then
							break
						end
						current_path = parent_path
					end
					return vim.fn.fnamemodify(current_path, ':t')
				end, {}),
			}
		)
	),
}
