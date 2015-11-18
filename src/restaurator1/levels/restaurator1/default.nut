function add_key(key)
{
  local keys = state.world2_keys;
  keys[key] = true;
  update_keys();
}

function exit_key(key)
{
  add_key(key);
  Tux.deactivate();
  wait(0.5);
  Tux.do_cheer();
  end_level();
}

/***************************************
 * Handling of the "keys" in the world *
 ***************************************/
if(! ("world2_keys" in state))
	state.world2_keys <- {}
	
local keys = state.world2_keys;
foreach(name in ["air", "earth", "wood", "fire", "water"])
{
  if(! (name in keys))
    keys[name] <- false;
}

/// this function updates the key images (call this if tux has collected a key)
function update_keys()
{
	local keys = state.world2_keys;
	foreach(name in ["air", "earth", "wood", "fire", "water"])
	{
	  key[name].set_action(keys[name] ? "display" : "outline");
	}
}

if(! ("key" in this))
 key <- {};

local x = 10;
local y = 10;

foreach(name in ["air", "earth", "wood", "fire", "water"])
{
  if(! (name in key) ) {
    key[name] <- FloatingImage("images/objects/keys/key_" + name + ".sprite");
    key[name].set_anchor_point(ANCHOR_TOP_LEFT);
    key[name].set_pos(x, y);
    key[name].set_visible(true);
  }
  x += 30;
}

update_keys();
