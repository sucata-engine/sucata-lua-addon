---@meta

---Sucata Game Engine - Main API
---@class sucata
sucata = {}

---@class State
---@field id? number The unique identifier of the entity, will have an id when spawned
---@field [string] any Custom properties - you can add any field you want to the entity

---@class Behaviour
---@field tick function? The tick function called every frame, contains state as parameter
---@field draw function? The draw function called every frame, contains state as parameter
---@field free function? The free function called when the entity is destroyed, contains state as parameter
---@field init function? The init function called when the entity is spawned, contains state as parameter

---@class Root
---@field init fun()? Called once when the game starts, before the entities
---@field tick fun()? Called every frame, before the entities
---@field draw fun()? Called every frame, before the entities; drawing is allowed here
---@field free fun()? Called once when the game closes, before the entities are freed

---@class Entity
---@field state State The state of the entity
---@field behaviours? Behaviour[] List of behaviours attached to the entity

---@class Timer
---@field time number The duration of the timer in seconds
---@field auto_start? boolean Whether the timer should start automatically (default: true)
---@field one_shot? boolean Whether the timer should only run once (default: true)
---@field loop? boolean Whether the timer should loop (default: false)

---@alias RGBAColor number[] RGBA color as {r, g, b, a?} with values 0.0-1.0; a is optional and defaults to 1.0

---@class RectProps
---@field x? number The x position (default: 0)
---@field y? number The y position (default: 0)
---@field width? number The width (default: 50)
---@field height? number The height (default: 50)
---@field color? RGBAColor The color as {r, g, b, a?} (default: {1, 1, 1, 1})
---@field z_index? number The z-index for layering (default: 0)
---@field texture? string Path to texture file (default: "")
---@field scale? number Uniform scale factor (default: 1.0)
---@field scale_x? number Scale factor on X axis (default: 1.0)
---@field scale_y? number Scale factor on Y axis (default: 1.0)
---@field fixed? boolean Whether the rectangle is fixed to the screen (default: false)
---@field origin? number Uniform origin point (default: 0.0)
---@field origin_x? number Origin point on X axis (default: 0.0)
---@field origin_y? number Origin point on Y axis (default: 0.0)
---@field rotation? number Rotation in radians (default: 0.0)
---@field opacity? number Opacity value to the rect from 0.0 to 1.0 (default: 1.0)
---@field atlas_size? number Size of the texture atlas (default: 0.0)
---@field atlas_width? number Width of each frame in the texture atlas (default: 0.0)
---@field atlas_height? number Height of each frame in the texture atlas (default: 0.0)
---@field atlas_spacing? number Spacing between frames in the texture atlas (default: 0.0)
---@field atlas_margin? number Margin around the frames in the texture atlas (default: 0.0)
---@field atlas_x? number X index of the frame in the texture atlas	(default: 0.0)
---@field atlas_y? number Y index of the frame in the texture atlas (default: 0.0)
---@field shader? number ID of the shader to use, returned by load_shader (default: 0)
---@field shader_args? table Arguments for shader rendering (default: {})
---@field tiled? boolean Whether the texture should be tiled (default: false)
---@field tile_size? number Size of the tile (default: 0.0)
---@field tile_width? number Width of the tile (default: 0.0)
---@field tile_height? number Height of the tile (default: 0.0)

---@class TextProps
---@field x? number The x position (default: 0)
---@field y? number The y position (default: 0)
---@field text? string The text to display (default: "")
---@field size? number The font size (default: 16)
---@field font? string Path to font file (default: "")
---@field color? RGBAColor The color as {r, g, b, a?} (default: {1, 1, 1, 1})
---@field z_index? number The z-index for layering (default: 0)
---@field scale? number Uniform scale factor (default: 1.0)
---@field scale_x? number Scale factor on X axis (default: 1.0)
---@field scale_y? number Scale factor on Y axis (default: 1.0)
---@field fixed? boolean Whether the text is fixed to the screen (default: false)
---@field origin? number Uniform origin point (default: 0.0)
---@field origin_x? number Origin point on X axis (default: 0.0)
---@field origin_y? number Origin point on Y axis (default: 0.0)
---@field rotation? number Rotation in radians (default: 0.0)
---@field opacity? number Opacity value to the text from 0.0 to 1.0 (default: 1.0)
---@field align? string Text alignment: "left", "center", or "right" (default: "left")
---@field max_width? number Maximum width of the text (default: 0.0)
---@field shader? number ID of the shader to use, returned by load_shader (default: 0)
---@field shader_args? table Arguments for shader rendering (default: {})

---@class Rect
---@field x number The x position
---@field y number The y position
---@field width number The width
---@field height number The height

---@class ScreenRelativeRect
---@field top? number Top position as percentage (0-1) (default: 0)
---@field left? number Left position as percentage (0-1) (default: 0)
---@field right? number Right position as percentage (0-1) (default: 0)
---@field bottom? number Bottom position as percentage (0-1) (default: 0)

---@class AudioProps
---@field sound string Path to the sound file
---@field volume? number Volume of the sound (default: 1.0)
---@field pitch? number Pitch of the sound (default: 1.0)
---@field group? string Audio group (default: "default")
---@field loop? boolean Whether the sound should loop (default: false)

---Shared optional overrides accepted by every sucata.ui.draw_* widget call.
---@class UIStyle
---@field x? number Overrides the widget's auto-layout x position; must be set together with y/width/height
---@field y? number Overrides the widget's auto-layout y position; must be set together with x/width/height
---@field width? number Overrides the widget's auto-layout width; must be set together with x/y/height
---@field height? number Overrides the widget's auto-layout height; must be set together with x/y/width
---@field text_size? number Text pixel height (default font height is 18); scales the bitmap font, large values look blocky
---@field color? RGBAColor Text color as {r, g, b, a?}
---@field background_color? RGBAColor Widget frame/background color as {r, g, b, a?}
---@field border_color? RGBAColor Border color as {r, g, b, a?}; set alpha to 0 to hide the border

---@class UIWindowProps : UIStyle
---@field title? string Window title, also used as its unique id (default: "Window")
---@field x? number The x position (default: 40)
---@field y? number The y position (default: 40)
---@field width? number The width (default: 200)
---@field height? number The height (default: 150)
---@field transparent? boolean Hide the window body background, keeps the title bar (default: false)
---@field movable? boolean Whether the title bar can be dragged to move the window (default: true)
---@field resizable? boolean Whether the resize handle is shown (default: true)

---@class UITextWidgetProps : UIStyle
---@field text? string The text to display (default: "")

---@class UIButtonProps : UIStyle
---@field text? string The button label (default: "")

---@class UICheckboxProps : UIStyle
---@field id string Unique key used to persist the checked state across frames
---@field text? string The checkbox label (default: "")

---@class UISliderProps : UIStyle
---@field id string Unique key used to persist the value across frames
---@field value? number Initial value; only used the first time this id is seen (default: 0)
---@field low? number Minimum value (default: 0)
---@field high? number Maximum value (default: 100)
---@field step? number Step increment; 0 means continuous (default: 0)

---@class UITextboxProps : UIStyle
---@field id string Unique key used to persist the typed text across frames
---@field text? string Initial text; only used the first time this id is seen (default: "")

---@class UIPopupProps
---@field name string Unique popup id, matching the name passed to sucata.ui.popup_open

---@class UIHeaderProps : UIStyle
---@field text? string The header label, also used as its unique id (default: "")
---@field expanded? boolean Whether it's expanded the first time this label is seen (default: false)

---@class UITreeNodeProps : UIStyle
---@field text? string The tree node label, also used as its unique id (default: "")
---@field expanded? boolean Whether it's expanded the first time this label is seen (default: false)

---@class UILayoutRowProps
---@field widths? number[] Column widths in pixels: positive is a fixed width, negative fills remaining row space (e.g. -1 takes up the rest), 0/omitted uses the widget's default width. Row wraps to the next line after `#widths` widgets are drawn.
---@field height? number Row height in pixels; 0/omitted uses the widget's default height (default: 0)
