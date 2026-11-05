---@meta

---Sucata Game Engine - Main API
---@class sucata
sucata = {}

---true when the game runs with `sucata run`, false in a built game
---@type boolean
sucata.debug = ...

---Registers an addon. Addons run in every frame phase ordered by `order`, each in its own protected call
---@generic T : Addon
---@param addon T|string The addon table, or a module name to require
---@return T addon The registered addon
function sucata.use(addon) end

---@class State
---@field id? number The unique identifier of the entity, will have an id when spawned
---@field [string] any Custom properties - you can add any field you want to the entity

---@class Behaviour
---@field init fun(state: State)? Called once when the entity is spawned
---@field tick fun(state: State, dt: number)? Called every frame; dt is the delta time in seconds, already scaled by the time scale
---@field draw fun(state: State)? Called every frame after tick; drawing is allowed here
---@field free fun(state: State)? Called once when the entity is destroyed or the game closes

---@class Addon
---@field order? number When the addon runs in every phase, lower first. sucata.time is -1000, the root 0 and sucata.scene 100 (default: 0)
---@field name? string Name used in error messages
---@field init fun(dt: number)? Called once when the game starts
---@field tick fun(dt: number)? Called every frame
---@field draw fun(dt: number)? Called every frame after tick; drawing is allowed here
---@field late fun(dt: number)? Called at the end of every frame, after drawing
---@field free fun(dt: number)? Called once when the game closes

---@class Root : Addon

---@class Entity
---@field state State The state of the entity
---@field behaviours? Behaviour[] List of behaviours attached to the entity

---@class Timer
---@field time number The duration of the timer in seconds
---@field auto_start? boolean Whether the timer should start automatically (default: true)
---@field one_shot? boolean Whether the timer should only run once (default: true)
---@field loop? boolean Whether the timer should loop (default: false)

---@alias RGBAColor number[] RGBA color as {r, g, b, a?} with values 0.0-1.0; a is optional and defaults to 1.0

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
---@field sound string Path to the sound file (.wav, .mp3, .ogg or .flac)
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
