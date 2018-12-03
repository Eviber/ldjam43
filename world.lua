local Entity = require "entity"


local World = {
	entities = {},
	systems = {}
}

function World:register(system)
	table.insert(self.systems, system)
	return system
end

function World:assemble(components)
	local entity = self:create()
	for i, v in ipairs(components) do
		assert(type(v) == "table")
		assert(#v > 0)
		local fn = v[1]
		assert(type(fn) == "function")
		
		if #v == 1 then
			entity:add(fn())
		else
			local args = {}
			for j = 2, #v do
				table.insert(args, v[j])
			end
			print(unpack(args))
			entity:add(fn(unpack(args)))
		end
	end
	return entity
end


function World:create()
	local entity = Entity.new()
	table.insert(self.entities, entity)
	return entity
end


function World:update(dt)
	for i = #self.entities, 1, -1 do
		local entity = self.entities[i]
		if entity.remove then
			for i, system in ipairs(self.systems) do
				if system:match(entity) then
					system:destroy(entity)
				end
			end
			table.remove(self.entities, i)
		else
			for i, system in ipairs(self.systems) do
				if system:match(entity) then
					if entity.loaded == false then
						system:load(entity)
					end
					system.update(dt, entity)
				end
			end
			entity.loaded = true
		end
	end
end

function World:draw()
	for i = 1, #self.entities do
		local entity = self.entities[i]
		for i, system in ipairs(self.systems) do
			if system:match(entity) then
				system:draw(entity)
			end
		end
	end
end

return World
