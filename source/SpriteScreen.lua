local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

class('SpriteScreen').extends()

function SpriteScreen:init()
  local starImage = gfx.image.new("assets/star.png")
  local starSprite = sprite.new(starImage)
  starSprite:moveTo(250, 100)
  starSprite:add()

  self.starSprite = starSprite
end

function SpriteScreen:update(position)
  self.starSprite:setRotation(position)
end

function SpriteScreen:clear()
  if self.starSprite then self.starSprite:remove() end
end
