local definePacket = require(script.Parent.packets.packet)
local types = require(script.Parent.types)

local extensions = {}

function extensions.wrapRemoteFunction<T, U>(invokePacket: types.Packet<T>, returnPacket: types.Packet<U>)
	return {
		onInvoke = function(callback: (data: T, player: Player) -> U): ()
			invokePacket.listen(function(data, player: Player)
				returnPacket.sendTo(callback(data, player), player)
			end)
		end,
		invoke = function(data: T): U
			invokePacket.send(data)
			return returnPacket.wait()
		end,
	}
end

return extensions
