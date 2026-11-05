---@meta

---The time module of sucata game engine
---@class sucata.time
sucata.time = {}

---Get the delta time (time elapsed since last frame) in seconds, multiplied by the time scale
---@return number delta The delta time in seconds
function sucata.time.get_delta() end

---Get the delta time in seconds without the time scale; timers use this value
---@return number delta The unscaled delta time in seconds
function sucata.time.get_raw_delta() end

---Get the current frames per second
---@return number fps The current FPS
function sucata.time.get_fps() end

---Create a timer with a callback function
---@param callback function The function to call when the timer expires
---@param config number|Timer Timer duration in seconds, or a timer configuration table
---@return number timer_id The ID of the created timer
function sucata.time.create_timer(callback, config) end

---Pause a timer
---@param timer_id number The ID of the timer to pause
function sucata.time.pause_timer(timer_id) end

---Resume a paused timer
---@param timer_id number The ID of the timer to resume
function sucata.time.resume_timer(timer_id) end

---Stop and remove a timer
---@param timer_id number The ID of the timer to stop
function sucata.time.stop_timer(timer_id) end

---Get time scale
---@return number time_scale The current time scale value
function sucata.time.get_time_scale() end

---Set time scale
---@param time_scale number The new time scale value
function sucata.time.set_time_scale(time_scale) end
