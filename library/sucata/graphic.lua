---@meta

---The graphic module of sucata game engine
---@class sucata.graphic
sucata.graphic = {}

---Draw a rectangle. Every option is positional; stop at the last one you need.
---The image, atlas frame and color come from the handle. With only the first six parameters the call goes straight to the engine through FFI. Draw phase only.
---@param texture number|string|nil Handle from load_texture, load_atlas or color, a texture path, or nil for a white rectangle
---@param x number The x position
---@param y number The y position
---@param width number The width
---@param height number The height
---@param z_index? number Layer used for sorting (default: 0)
---@param rotation? number Rotation in radians (default: 0)
---@param scale_x? number Scale on the X axis (default: 1)
---@param scale_y? number Scale on the Y axis (default: scale_x)
---@param origin_x? number Origin of rotation and scale on the X axis (default: 0)
---@param origin_y? number Origin of rotation and scale on the Y axis (default: origin_x)
---@param fixed? boolean Draw in screen space, ignoring the camera (default: false)
---@param tiled? boolean Repeat the texture instead of stretching it (default: false)
---@param tile_width? number Width of each tile (default: 0)
---@param tile_height? number Height of each tile (default: tile_width)
---@param shader? number Shader ID returned by load_shader (default: 0)
---@param shader_args? table Shader arguments; when present the call uses the slower table path
function sucata.graphic.rect(texture, x, y, width, height, z_index, rotation, scale_x, scale_y, origin_x, origin_y,
                             fixed, tiled, tile_width, tile_height, shader, shader_args) end

---Draw text. Every option is positional; stop at the last one you need.
---With only the first five parameters the call goes straight to the engine through FFI. Draw phase only.
---@param text string|number The text to draw
---@param x number The x position
---@param y number The y position
---@param size? number Font size (default: 16)
---@param z_index? number Layer used for sorting (default: 0)
---@param r? number Red, 0.0-1.0 (default: 1)
---@param g? number Green, 0.0-1.0 (default: 1)
---@param b? number Blue, 0.0-1.0 (default: 1)
---@param a? number Alpha, 0.0-1.0 (default: 1)
---@param fixed? boolean Draw in screen space, ignoring the camera (default: false)
---@param font? number|string Handle from load_font, a font path, or nil for the default font
---@param align? "left"|"center"|"right" Text alignment (default: "left")
---@param max_width? number Wrap width, 0 disables wrapping (default: 0)
---@param rotation? number Rotation in radians (default: 0)
---@param scale_x? number Scale on the X axis (default: 1)
---@param scale_y? number Scale on the Y axis (default: scale_x)
---@param origin_x? number Origin of rotation and scale on the X axis (default: 0)
---@param origin_y? number Origin of rotation and scale on the Y axis (default: origin_x)
---@param shader? number Shader ID returned by load_shader (default: 0)
---@param shader_args? table Shader arguments; when present the call uses the slower table path
function sucata.graphic.text(text, x, y, size, z_index, r, g, b, a, fixed, font, align, max_width, rotation,
                             scale_x, scale_y, origin_x, origin_y, shader, shader_args) end

---Register a texture with a tint and get a handle for rect. The image loads lazily on first draw.
---The same path and color return the same handle; another color is another handle of the same image
---@param path string Path to the texture, usually src://...
---@param r? number Red tint, 0.0-1.0 (default: 1)
---@param g? number Green tint, 0.0-1.0 (default: 1)
---@param b? number Blue tint, 0.0-1.0 (default: 1)
---@param a? number Alpha, 0.0-1.0 (default: 1)
---@return number handle Texture handle
function sucata.graphic.load_texture(path, r, g, b, a) end

---Split a texture into frames of the same size. Returns one handle per frame, indexed from 1,
---left to right then top to bottom. All frames share the image, so they batch together
---@param path string Path to the texture
---@param frame_width number Width of each frame in pixels
---@param frame_height? number Height of each frame in pixels (default: frame_width)
---@param spacing? number Pixels between frames (default: 0)
---@param margin? number Pixels around the frames (default: 0)
---@param r? number Red tint, 0.0-1.0 (default: 1)
---@param g? number Green tint, 0.0-1.0 (default: 1)
---@param b? number Blue tint, 0.0-1.0 (default: 1)
---@param a? number Alpha, 0.0-1.0 (default: 1)
---@return number[] frames Frame handles
function sucata.graphic.load_atlas(path, frame_width, frame_height, spacing, margin, r, g, b, a) end

---Get a handle that draws a solid color with rect. The same color returns the same handle
---@param r number Red, 0.0-1.0
---@param g number Green, 0.0-1.0
---@param b number Blue, 0.0-1.0
---@param a? number Alpha, 0.0-1.0 (default: 1)
---@return number handle Color handle
function sucata.graphic.color(r, g, b, a) end

---Register a font path and get a handle for text
---@param path string Path to the font file
---@return number handle Font handle
function sucata.graphic.load_font(path) end

---Set the background color of the window
---@param color RGBAColor The color as {r, g, b, a?}
function sucata.graphic.set_background_color(color) end

---Loads a custom GLSL shader; sucata run and sucata build compile it for the current OS automatically
---@param path string Path to the .glsl shader as a literal string (or to a compiled .schd)
---@return number|nil shader_id The ID of the loaded shader, or nil if loading failed
function sucata.graphic.load_shader(path) end

---Adds a post-processing effect using a loaded shader
---@param shader_id number The shader ID returned by load_shader
function sucata.graphic.add_post_processing(shader_id) end

---Sets a parameter on an active post-processing shader
---@param shader_id number The shader ID of the post-processing effect
---@param field string The name of the shader argument to set
---@param value number|table The value to set (number for float, table of 2/3/4 numbers for vec2/vec3/vec4)
function sucata.graphic.set_post_processing_args(shader_id, field, value) end

---Removes an active post-processing effect
---@param shader_id number The shader ID of the post-processing effect to remove
function sucata.graphic.remove_post_processing(shader_id) end

---Loads a texture immediately and marks it "hot", exempting it from the automatic per-frame unloading of textures not drawn that frame
---@param path string File path to the texture to preload
function sucata.graphic.preload_texture(path) end

---Gets the number of draws after which a texture is automatically promoted to "hot" and stops being unloaded when not drawn in a frame
---@return number threshold The current hot-texture use threshold (default: 300)
function sucata.graphic.get_hot_texture_threshold() end

---Sets the number of draws after which a texture is automatically promoted to "hot". Applies going forward only. Pass 0 to disable automatic promotion entirely — textures then only become hot via preload_texture
---@param threshold number The new hot-texture use threshold, or 0 to disable automatic promotion (minimum 0)
function sucata.graphic.set_hot_texture_threshold(threshold) end
