---@meta

---The events module of sucata game engine
---@class sucata.events
sucata.events = {}

---Emit an event with the given name and data
---@param name string The name of the event
---@param data table Additional data to pass with the event
function sucata.events.emit(name, data) end

---Handle an event with the given name and callback
---@param owner number|Entity The entity owner of the handler (can be entity table or entity ID)
---@param name string The name of the event
---@param callback function The function to call when the event is emitted
function sucata.events.on(owner, name, callback) end

---Remove the handlers registered by an owner
---@param owner number|State The entity state or entity ID that registered the handlers
---@param name? string Only remove handlers for this event; without it every handler of the owner is removed
function sucata.events.off(owner, name) end
