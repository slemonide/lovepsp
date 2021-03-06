-- Load the font, 16 pixels in height, to RAM
verdana16 = pge.font.load("verdana.ttf", 16, PGE_RAM)

-- Check the font loaded correctly
if not verdana16 then
	error("Failed to load font.")
end

-- Init net and check success
if not pge.net.init() then
	error("Error on net init.")
end

-- Init net dialog and check success
if not pge.utils.netinit() then
	error("Error on net dialog init.")
end

-- Create two colors
white = pge.gfx.createcolor(255, 255, 255)
red = pge.gfx.createcolor(255, 0, 0)

-- Create some variables
enabled = true
state = -1
text = ""
textresult = ""
x = 0
y = 0
counter = 0

-- Loop until exit requested
while pge.running() do

	-- Update controls
	pge.controls.update()

	-- Start drawing
	pge.gfx.startdrawing()
	
	-- Clear screen (to black)
	pge.gfx.clearscreen()
	
	-- Draw a rectable
	pge.gfx.drawrect(x, y, 100, 60, red)
	
	-- If net dialog not displayed draw some text
	if not enabled then
		verdana16:activate()
		verdana16:printcenter(100, white, text)
		verdana16:print(20, 130, white, textresult)
	end
	
	-- End drawing
	pge.gfx.enddrawing()
	
	if enabled then
		-- pge.utils.netupdate() must be called after pge.gfx.enddrawing(), but before pge.gfx.swapbuffers()
		state = pge.utils.netupdate()
	
		if state == 0 then
			-- We're connected, POST the form
			success, textresult = pge.net.postform("http://pge.luaplayer.org/postform/postform.php", "version=2&username=somename&score=132", 4096)
			text = "Net dialog exited successfully.\n"
			pge.net.shutdown()
			enabled = false
		elseif state == 1 then
			text = "Net dialog exited via cancellation."
			enabled = false
			pge.net.shutdown()
		elseif state ~= PGE_UTILS_DIALOG_RUNNING then
			text = "Internal error."
			enabled = false
			pge.net.shutdown()
		end
	end
	
	-- Swap buffers
	pge.gfx.swapbuffers()
	
	-- Increment counter
	counter = counter + 1
	
	-- Set the rectangle to a random screen position 
	if counter >= 60 then
		counter = 0
		x = pge.math.randfloat(0, 380)
		y = pge.math.randfloat(0, 212)
	end
	
	-- If START pressed, end
	if pge.controls.pressed(PGE_CTRL_START) then
		break
	end
	
end

verdana16 = nil
success = nil
enabled = nil
state = nil
text = nil
textresult = nil
x = nil
y = nil
counter = nil