---@meta

---The scene module of sucata game engine
---@class sucata.scene
sucata.scene = {}

---Spawn an entity in the scene
---@param entity Entity The entity table to spawn
---@return number entity_id The ID of the spawned entity
function sucata.scene.spawn(entity) end

---Spawn multiple entities in the scene
---@param entities Entity[] Array of entity tables to spawn
---@return number[] entity_ids Array of IDs of the spawned entities
function sucata.scene.spawns(entities) end

---Find an entity by its ID
---@param entity_id number The ID of the entity to find
---@return State|nil state The entity state or nil if not found
function sucata.scene.find_by_id(entity_id) end

---Destroy an entity from the scene
---@param entity_or_id Entity|number The entity table or entity ID to destroy
---@return boolean success Whether the entity was successfully destroyed
function sucata.scene.destroy(entity_or_id) end

---Destroy multiple entities from the scene
---@param entities Entity[] Array of entity tables to destroy
---@return number[] undestroyed_ids Array of IDs of entities that could not be destroyed
function sucata.scene.destroys(entities) end

---Add a tag to an entity
---@param entity_or_id Entity|number The entity table or entity ID
---@param tag string The tag to add
---@return boolean success Whether the tag was successfully added
function sucata.scene.add_tag(entity_or_id, tag) end

---Check if an entity has a tag
---@param entity_or_id Entity|number The entity table or entity ID
---@param tag string The tag to check
---@return boolean success Whether the entity has the tag
function sucata.scene.has_tag(entity_or_id, tag) end

---Remove a tag from an entity
---@param entity_or_id Entity|number The entity table or entity ID
---@param tag string The tag to remove
---@return boolean success Whether the tag was successfully removed
function sucata.scene.remove_tag(entity_or_id, tag) end

---Get all entity IDs in the scene
---@return number[] entity_ids Array of all entity IDs in the scene
function sucata.scene.get_entities() end

---Get all entity IDs with a specific tag
---@param tag string The tag to filter by
---@return number[] entity_ids Array of entity IDs with the given tag
function sucata.scene.get_entities_by_tag(tag) end

---Destroy every entity in the scene at the end of the frame, keeping global entities and the ones spawned after this call
function sucata.scene.clear_entities() end

---Stores an entity globally under a key; global entities are not removed by clear_entities
---@param key string The key to store the entity under
---@param entity Entity The entity to store
---@return number entity_id The ID of the spawned global entity
function sucata.scene.load_global(key, entity) end

---Retrieves a globally stored entity by key
---@param key string The key the entity was stored under
---@return Entity|nil entity The global entity state, or nil if not found
function sucata.scene.get_global(key) end

---Removes a globally stored entity by key
---@param key string The key of the global entity to remove
function sucata.scene.unload_global(key) end
