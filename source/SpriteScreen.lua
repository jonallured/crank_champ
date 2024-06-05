local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

class('SpriteScreen').extends()

function SpriteScreen:init()
  -- local starImage = gfx.image.new("assets/star-no-dither.png")
  -- sjh look here
  local starImages = gfx.imagetable.new("assets/star-sheet-table-96-96.png")
  local starSprite = sprite.new()
  starSprite.images = starImages
  starSprite:setImage(starSprite.images:getImage(1))
  starSprite:moveTo(250, 100)
  starSprite:add()

  self.starSprite = starSprite
end

-- sjh look here
function SpriteScreen:update(ticks)
  self.starSprite:setImage(self.starSprite.images:getImage(ticks + 1))
end

function SpriteScreen:clear()
  if self.starSprite then self.starSprite:remove() end
end
