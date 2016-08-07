--love2d port for psp
--GNU GPL 2 AnRu all rights reserved

--main module
love = {}

--other modules
love.graphics = {}
love.image = {}
love.filesystem = {}
love.timer = {}
love.joystick = {}
love.keyboard = {}
love.timer = {}

--font
--Load a font, 12 pixels high, in VRAM
verdana12 = pge.font.load("verdana.ttf", 12, PGE_VRAM)

--callbacks
love.load = function ()
end

love.update = function ()
end

love.draw = function ()
end

love.joystick.isDown = function (b)
end

love.keyboard.isDown = function (b)
return love._controls[b]
end


--const

love._version = "0.8.0"
love._os = "PSP"
love._color = {255,255,255}
love._backColor = {0,0,0}
love._controls = {}
love._currentTime = 0
love._lastTime = 0
love._loop=0





--GRAPHICS


love.graphics.newImage = function (filepath)
 return pge.gfx.load(filepath, PGE_RAM)
end

love.graphics.draw = function (image, x, y, a, width, height)
if not a then
 image:activate()
 image:draweasy(x,y)
else
 image:activate()
 image:draw(x,y,width,height,0,0,width,height,a)
end
end

love.graphics.drawq = function (image, x, y, a, width, height)
if not a then
 image:activate()
 image:draweasy(x,y)
else
 image:draw(x,y,width,height,0,0,width,height,a)
end
end


love.graphics.rectangle = function(mode, x, y, w, h)
 screen:fillRect(x, y, w, h, Color.new(love._color[1],love._color[2],love._color[3]) )
end

love.graphics.print = function (text, x, y, a)
 screen:print(x,y,text,Color.new(love._color[1],love._color[2],love._color[3]))
end

love.graphics.setMode = function ()
end

love.graphics.setColor = function (r, g, b, a)
 if r==nil or g==nil or b==nil then
  error("[LOVE]: ...setColor: one of the colors expected")
 end
 love._color = {r, g, b, a}
end


love.graphics.setBackgroundColor = function (r, g, b, a)
 if r==nil or g==nil or b==nil then
  error("[LOVE]: ...setBackgroundColor: one of the colors expected")
 end
 love._backColor = {r, g, b, a}
end


--CONTROLS




love.keyboard.updateButtons = function ()

love._controls["cross"] = pge.controls.held(PGE_CTRL_CROSS)
love._controls["circle"] = pge.controls.held(PGE_CTRL_CIRCLE)
love._controls["triangle"] = pge.controls.held(PGE_CTRL_TRIANGLE)
love._controls["square"] = pge.controls.held(PGE_CTRL_SQUARE)

love._controls["up"] = pge.controls.held(PGE_CTRL_UP)
love._controls["down"] = pge.controls.held(PGE_CTRL_DOWN)
love._controls["left"] = pge.controls.held(PGE_CTRL_LEFT)
love._controls["right"] = pge.controls.held(PGE_CTRL_RIGHT)

love._controls["l"] = pge.controls.held(PGE_CTRL_LTRIGGER)
love._controls["r"] = pge.controls.held(PGE_CTRL_RTRIGGER)

end



--TIMER

love.timer.getDelta = function ()
 return love._dt
end

love.timer.getFPS = function ()
 return love._fps
end





--FILESYSTEM

love.filesystem.write = function (filepath, text)
 file = pge.file.open(filepath, PGE_FILE_CREATE + PGE_FILE_WRONLY)
 file:write(text)
end



--game

love.run = function ()

 love.load()
 love._frameTimer:start()
 while pge.running() do

  -- Update controls
  pge.controls.update()

  love.update(love._dt)

  if love.keypressed then
   if pge.controls.pressed(PGE_CTRL_CROSS) then
    love.keypressed("cross")
   end
   if pge.controls.pressed(PGE_CTRL_CIRCLE) then
    love.keypressed("circle")
   end
   if pge.controls.pressed(PGE_CTRL_TRIANGLE) then
    love.keypressed("triangle")
   end  
   if pge.controls.pressed(PGE_CTRL_SQUARE) then
    love.keypressed("square")
   end  
   
   if pge.controls.pressed(PGE_CTRL_UP) then
    love.keypressed("up")
   end
   if pge.controls.pressed(PGE_CTRL_DOWN) then
    love.keypressed("down")
   end
   if pge.controls.pressed(PGE_CTRL_LEFT) then
    love.keypressed("left")
   end  
   if pge.controls.pressed(PGE_CTRL_RIGHT) then
    love.keypressed("right")
   end  
   
   
   
   if pge.controls.pressed(PGE_CTRL_LTRIGGER) then
    love.keypressed("r")
   end
   if pge.controls.pressed(PGE_CTRL_RTRIGGER) then
    love.keypressed("l")
   end
  end
  
  
  
  


  if love.released then
   if pge.controls.released(PGE_CTRL_CROSS) then
    love.keyreleased("cross")
   end
   if pge.controls.released(PGE_CTRL_CIRCLE) then
    love.keyreleased("circle")
   end
   if pge.controls.released(PGE_CTRL_TRIANGLE) then
    love.keyreleased("triangle")
   end  
   if pge.controls.released(PGE_CTRL_SQUARE) then
    love.keyreleased("square")
   end  
   
   if pge.controls.released(PGE_CTRL_UP) then
    love.keyreleased("up")
   end
   if pge.controls.released(PGE_CTRL_DOWN) then
    love.keyreleased("down")
   end
   if pge.controls.released(PGE_CTRL_LEFT) then
    love.keyreleased("left")
   end  
   if pge.controls.released(PGE_CTRL_RIGHT) then
    love.keyreleased("right")
   end  
   
   
   
   if pge.controls.released(PGE_CTRL_LTRIGGER) then
    love.keyreleased("r")
   end
   if pge.controls.released(PGE_CTRL_RTRIGGER) then
    love.keyreleased("l")
   end
  end






  
  
  -- Start drawing  
  pge.gfx.startdrawing()
  
  -- Clear screen (to black)
  pge.gfx.clearscreen(pge.gfx.createcolor(love._backColor[1],love._backColor[2],love._backColor[3]))
  
  love.draw()

  -- End drawing
  pge.gfx.enddrawing()
  
  -- Swap buffers
  pge.gfx.swapbuffers()

 end

end

