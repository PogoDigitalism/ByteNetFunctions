Example usage;
```luau
-- client
local success = BytenetUtils.wrapRemoteFunction(
  QuestPackets.iClaimQuest, 
  QuestPackets.rClaimQuest
).invoke(
  questId
)

--server
BytenetUtils.wrapRemoteFunction(QuestPackets.iClaimQuest, QuestPackets.rClaimQuest).onInvoke(
  function(id, player)
    return ServerQuestFuncs.claimQuestRewards(player, id)
	end
)
```
namespace declaration example;
```luau
local ByteNet = require(script.Parent.Parent.ByteNet)

return ByteNet.defineNamespace("Crates", function()
	return {
		iClaimQuest = ByteNet.definePacket({
			value = ByteNet.uint16
		}),

		rClaimQuest = ByteNet.definePacket({
			value = ByteNet.bool
		}),
	}
end)
```
